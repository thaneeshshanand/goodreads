require "rails_helper"

RSpec.describe BookMailer, type: :mailer do
  describe "book_rating" do
    let(:mail) { BookMailer.book_rating }

    it "renders the headers" do
      expect(mail.subject).to eq("Book rating")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
