require_relative './test'

class NexmoAccountTest < Nexmo::Test
  def account
    Nexmo::Account.new(client)
  end

  def test_balance_method
    uri = 'https://rest.nexmo.com/account/get-balance'

    request_stub = stub_request(:get, uri).with(query: api_key_and_secret).to_return(response)

    assert_equal response_object, account.balance
    assert_requested request_stub
  end

  def test_update_method
    uri = 'https://rest.nexmo.com/account/settings'

    callback_url = 'https://example.com/callback'

    params = {'moCallBackUrl' => callback_url}

    request_stub = stub_request(:post, uri).with(headers: headers, body: params.merge(api_key_and_secret)).to_return(response)

    assert_equal response_object, account.update(mo_call_back_url: callback_url)
    assert_requested request_stub
  end

  def test_topup_method
    uri = 'https://rest.nexmo.com/account/top-up'

    params = {trx: '00X123456Y7890123Z'}

    request_stub = stub_request(:post, uri).with(headers: headers, body: params.merge(api_key_and_secret)).to_return(response)

    assert_equal response_object, account.topup(params)
    assert_requested request_stub
  end
end
