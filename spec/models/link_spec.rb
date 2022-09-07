require 'rails_helper'

RSpec.describe Link, type: :model do

    it "always has an original URL and a short code" do
        link = Link.new(
            original_url: "https://www.codewars.com/users/TakoKing8217",
            lookup_code: "1234567"
        )
        expect(link.valid?).to be(true)
        
    end

    it "is invalid if does not have a lookup code" do
        link = Link.new(
            original_url: "https://www.codewars.com/users/TakoKing8217"
        )
        expect(link.valid?).not_to be(true)
        
    end
    it "is invalid if does not have an original url" do
        link = Link.new(
        lookup_code: "1234567"
        )
        expect(link.valid?).not_to be(true)
        
    end

    it "is invalid if the lookup code already exists" do 
        link = Link.new(
            original_url: "https://www.codewars.com/users/TakoKing8217",
            lookup_code: "1234567"
        )
        link.save

        link_2 = Link.new(
            original_url: "https://www.codewars.com/users/MichaelWSmith",
            lookup_code: "1234567"
        )
        expect(link_2.valid?).to be(false)
    end
end
