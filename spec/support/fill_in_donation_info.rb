def fill_in_donation_info(
    first_name,
    last_name,
    donation_amount = 444333,
    cc_num = 4111111111111111,
    date = '7/2020',
    cvv = 123
  )
  fill_in 'first_name',         with: first_name
  fill_in 'last_name',          with: last_name
  fill_in 'donation_amount',    with: donation_amount
  fill_in 'credit_card_number', with: cc_num
  fill_in 'expiration',         with: date
  fill_in 'CVV',                with: cvv
end
