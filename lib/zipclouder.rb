# -*- encoding: utf-8 -*-
require "zipclouder/version"
require 'open-uri'
require 'openssl'
require 'net/http'
require 'uri'
require 'timeout'
require 'hashie'

class Zipclouder < Hashie::Mash
  ZIPCLOUD_HOST = 'zipcloud.ibsnet.co.jp'.freeze
  ZIPCLOUD_API_URI = '/api/search'.freeze
  ZIPCLOUD_CONNECT_TIME = 10

  def self.search zipcode
    args = {
      zipcode: zipcode
    }
    params = args.map {|k,v| "#{k}=#{v}"}.join('&')

    json = post_connect params
    unless json.blank?
      self.new JSON.parse json
    end
  end

  def success?
    status.eql?(200)
  end

  def address
    res = result
    [
      res.address1,
      res.address2,
      res.address3
    ].join
  end

  def kana
    res = result
    [
      res.kana1,
      res.kana2,
      res.kana3
    ].join
  end

  def pref_code
    result.prefcode
  end

  def zip_code
    result.zipcode
  end

  def result
    if success?
      if results.present?
        if results.one?
          results.first
        else
          "Error::Multpul Results"
        end

      else
        "Error::No Result"
      end
    else
      error_message
    end
  end

  def error_message
    message
  end

private
  def self.post_connect params
    host = ZIPCLOUD_HOST
    uri = ZIPCLOUD_API_URI
    http = set_net_http host
    resp = ""

    begin
      timeout(ZIPCLOUD_CONNECT_TIME) do
        Rails.logger.info("////////// url:http://#{host}#{uri}?#{params}")
        resp = http.post(uri, params)
      end
    rescue Exception => e
      raise e
    end
    resp.body
  end

  def self.set_net_http host
    http = Net::HTTP.new(host,80)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end
end
