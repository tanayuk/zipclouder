require 'spec_helper'
require "webmock/rspec"
WebMock.allow_net_connect!
ZIPCLOUD_LINK = "http://zipcloud.ibsnet.co.jp/api/search?zipcode=7830060".freeze


describe Zipclouder do
  before do
    @zipclouder = Zipclouder.new zipcloud_body
  end


  it 'should have a version number' do
    Zipclouder::VERSION.should_not be_nil
  end

  describe 'search' do
    it 'class is ziclouder' do
      @zipclouder.class.should == Zipclouder
    end
  end

  describe 'success?' do
    it 'returns true when status is 200' do
      @zipclouder.success?.should be_true
    end
  end

  describe 'address' do
    it 'returns specific text' do
      @zipclouder.address.should == "高知県南国市蛍が丘"
    end
  end

  describe 'kana' do
    it 'returns specifix text' do
      @zipclouder.kana.should == "ｺｳﾁｹﾝﾅﾝｺｸｼﾎﾀﾙｶﾞｵｶ"
    end
  end

  describe 'pref_code' do
    it 'returns the prefecture code' do
      @zipclouder.pref_code.should == "39"
    end
  end

  describe 'zip_code' do
    it 'returns the zip code' do
      @zipclouder.zip_code.should == "7830060"
    end
  end

  describe 'error_message' do
    it 'returns message' do
      @zipclouder.error_message.should be_nil
    end
  end

end
def zipcloud_body
{
  "message" =>  nil,
  "results" => [
  {
      "address1" => "高知県",
      "address2"=> "南国市",
      "address3" => "蛍が丘",
      "kana1" => "ｺｳﾁｹﾝ",
      "kana2" => "ﾅﾝｺｸｼ",
      "kana3" => "ﾎﾀﾙｶﾞｵｶ",
      "prefcode" => "39",
      "zipcode" => "7830060"
  }
  ],
  "status" => 200
}
end
