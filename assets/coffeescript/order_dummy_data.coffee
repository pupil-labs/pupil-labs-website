getDummyData = (query) ->

  people =
    us : 'John'
    uk : 'George'
    de : 'Christen'
    jp : 'Takeshi'

  contact_info =
    contact:
      email_c : 'test@example.com'
      name_0_c : people[query] + 'C'
      name_1_c : people[query] + 'surnameC'
    billing:
      name_0_b : people[query] + 'B'
      name_1_b : people[query] + 'surnameB'
      address_0_b : 'test address line 1 B'
      address_1_b : 'test address line 2 B'
      company_b: 'TEST COMPANY B'
      vatid_b : 'test vat id'
    shipping:
      name_0_s : people[query] + 'S'
      name_1_s : people[query] + 'surnameS'
      address_0_s : 'test address line 1 S'
      address_1_s : 'test address line 2 S'
      company_s : 'TEST COMPANY S'
    checkbox:
      shipping_copy : 'checked'
      q_request: 'checked'
    notes:
      x_notes : 'this is a ' + query.toUpperCase() + ' test order...'

  test_order_form =
    us :
      country_b : 'United States Of America'
      country_s : 'United States Of America'
      city_b : 'Chicago'
      city_s : 'Chicago'
      division_b : 'IL'
      division_s : 'IL'
      phone_b : '15551212'
      phone_s : '15551212'
      postalCode_b : '60616'
      postalCode_s : '60616'
      o_type: 'quote'
    uk :
      country_b : 'United Kingdom'
      country_s : 'United Kingdom'
      city_s : 'London'
      city_b : 'London'
      division_s : 'London'
      division_b : 'London'
      phone_b : '02043390509'
      phone_s : '02043390509'
      postalCode_b : 'SE1 9PQ'
      postalCode_s : 'SE1 9PQ'
      o_type: 'quote'
    jp :
      country_b : 'Japan'
      country_s : 'Japan'
      city_s : 'Tokyo'
      city_b : 'Tokyo'
      division_s : 'Ginza'
      division_b : 'Ginza'
      phone_b : '0426245019'
      phone_s : '0426245019'
      postalCode_b : '104-0061'
      postalCode_s : '104-0061'
      o_type: 'quote'

  countryObj = Object.assign(
    test_order_form[query]
    contact_info.contact
    contact_info.billing
    contact_info.shipping
    contact_info.checkbox
    contact_info.notes
  )