import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

import { from, Observable, throwError, BehaviorSubject, of } from 'rxjs';
import { shareReplay, catchError, concatMap, tap, combineLatest } from 'rxjs/operators';
import createAuth0Client from '@auth0/auth0-spa-js';
import Auth0Client from '@auth0/auth0-spa-js/dist/typings/Auth0Client';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  auth0Client$ = (from(
    createAuth0Client({
      domain: 'twincrest.auth0.com',
      client_id: 'DU3ErIIs5nP63rZRAfmj0b6hJL10s8W4',
      redirect_uri: `${window.location.origin}/callback`
    })
  ) as Observable<Auth0Client>).pipe(
    shareReplay(1),
    catchError(err => throwError(err))
  );

  isAuthenticated$ = this.auth0Client$.pipe(
    concatMap((client: Auth0Client) => from(client.isAuthenticated())),
    tap(res => this.loggedIn = res)
  );

  handleRedirectCallback$ = this.auth0Client$.pipe(
    concatMap((client: Auth0Client) => from(client.handleRedirectCallback()))
  );

  private userProfileSubject$ = new BehaviorSubject<any>(null);
  userProfile$ = this.userProfileSubject$.asObservable();
  loggedIn: boolean;

  constructor(private router: Router) { }

  getUser$(options?): Observable<any> {
    return this.auth0Client$.pipe(
      concatMap((client: Auth0Client) => from(client.getUser(options))),
      tap(user => this.userProfileSubject$.next(user))
    );
  }

  localAuthSetup() {
    const checkAuth$ = this.isAuthenticated$.pipe(
      concatMap((loggedIn: boolean) => {
        if (loggedIn) {
          return this.getUser$();
        }

        return of(loggedIn);
      })
    );

    checkAuth$.subscribe((response: { [key: string]: any } | boolean) => {
      this.loggedIn = !!response;
    });
  }

  login(redirectPath: string = '/') {
    this.auth0Client$.subscribe((client: Auth0Client) => {
      client.loginWithRedirect({
        redirect_uri: `${window.location.origin}/callback`,
        appState: { target: redirectPath }
      });
    });
  }

  handleAuthCallback() {
    let targetRoute: string;

    const authComplete$ = this.handleRedirectCallback$.pipe(
      tap(cbRes => {
        targetRoute = cbRes.appState && cbRes.appState.target ? cbRes.appState.target : '/';
      }),
      concatMap(() => {
        return combineLatest(
          this.getUser$(),
          this.isAuthenticated$
        );
      })
    );

    // authComplete$.subscribe(([user, loggedIn]) => {
    //   this.router.navigate([targetRoute]);
    // });
  }

  logout() {
    this.auth0Client$.subscribe((client: Auth0Client) => {
      client.logout({
        client_id: 'DU3ErIIs5nP63rZRAfmj0b6hJL10s8W4',
        returnTo: `${window.location.origin}`
      });
    });
  }
}
