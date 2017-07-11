# encoding: utf-8
# copyright: 2015, The Authors

title 'SSL Cipher Suites'

include_controls 'ssl-baseline' do
  skip_control 'enc-cbc'
end
