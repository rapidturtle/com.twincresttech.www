require "spec_helper"

describe SiteMailer do
  describe "contact_message" do
    let(:mail) { SiteMailer.contact_message }

    it "renders the headers" do
      mail.subject.should eq("Contact message")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
