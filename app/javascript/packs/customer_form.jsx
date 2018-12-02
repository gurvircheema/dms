import React from 'react';
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types';
import axios from 'axios';

class CustomerForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      customer: {
        ...this.props.customer,
        address_attributes: this.props.customer.address,
        billing_address_attributes: this.props
      }
    }
    this.customerValueChanged = this.customerValueChanged.bind(this)
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.addressValueChanged = this.addressValueChanged.bind(this)
    this.billingAddressValueChanged = this.billingAddressValueChanged.bind(this)
  }

  customerValueChanged(event) {
    this.setState({
      customer: {
        ...this.state.customer,
        [event.target.name]: event.target.value
      }
    })
  }

  addressValueChanged(event) {
    this.setState({
      customer: {
        ...this.state.customer,
        address: {
          ...this.state.customer.address,
          [event.target.name]: event.target.value
        }
      }
    })
  }

  billingAddressValueChanged(event) {
    this.setState({
      customer: {
        ...this.state.customer,
        billing_address: {
          ...this.state.customer.billing_address,
          [event.target.name]: event.target.value
        }
      }
    })
  }

  handleFormSubmit(event) {
    event.preventDefault();
    let customer = this.state.customer
    customer.address_attributes = customer.address
    customer.billing_address_attributes = customer.billing_address
    let form_data = JSON.stringify({
      customer: this.state.customer
    })
    let csrf_token = document.head.querySelector('meta[name=csrf-token]').content
    let url = `/admin/customers/${this.state.customer.id}`
    let config = {
      headers: {
        'X-CSRF-Token': csrf_token,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    }
    axios.put(url, form_data, config)
      .then(response => {
        window.location = response.data.location
      })
      .catch(errors => {
        this.setState({
          ...this.state,
          ...errors.response.data
        })
      })
  }

  formClass(key_name) {
    let { errors } = this.state;
    return errors ? (errors.hasOwnProperty(key_name) ? 'form-control is-invalid' : 'form-control') : 'form-control'
  }

  errorMessage(key_name) {
    let { errors } = this.state;
    if(errors) {
      if (errors.hasOwnProperty(key_name)) {
        return <div className='invalid-feedback'>
          {errors[key_name].join(', ')}
        </div>
      }
    }
  }

  render = function(){
    let { customer } = this.state
    let { address, billing_address} = customer
    return (
      <div>
        <div className='row'>
          <div className='col-md-8'>
            <div className='form-group'>
              <label className='form-control-label'>Name</label>
              <input
                type='text'
                name='name'
                value={customer.name}
                onChange={this.customerValueChanged}
                className={this.formClass('name')}
              />
              {this.errorMessage('name')}
            </div>

            <div className='row'>
              <div className='col-md-6'>
                <div className='secondary-header'>Primary Address</div>
                <div className='form-group'>
                  <label className='form-control-label'>Address Line 1</label>
                  <input
                    type='text'
                    name='address_line_1'
                    value={address.address_line_1}
                    onChange={this.addressValueChanged}
                    className={this.formClass('address.address_line_1')}
                  />
                  {this.errorMessage('address.address_line_1')}
                </div>
                <div className='row'>
                  <div className='col-md-8'>
                    <div className='form-group'>
                      <label className='form-control-label'>City</label>
                      <input
                        type='text'
                        name='city'
                        value={address.city}
                        onChange={this.addressValueChanged}
                        className={this.formClass('address.city')}
                      />
                      {this.errorMessage('address.city')}
                    </div>
                  </div>
                  <div className='col-md-4'>
                    <label className='form-control-label'>State/Province</label>
                    <select
                      name='state_province'
                      value={address.state_province}
                      onChange={this.addressValueChanged}
                      className={this.formClass('address.state_province')}
                    >
                      {Object.keys(customer.state_list).map((key) =>
                        <option key={key} value={key}>{`${key}, ${customer.state_list[key]}`}</option>
                      )}
                    </select>
                    {this.errorMessage('address.state_province')}
                  </div>
                </div>
                <div className='row'>
                  <div className='col-md-6'>
                    <div className='form-group'>
                      <label className='form-control-label'>Country</label>
                      <select
                        name='country'
                        value={address.country}
                        onChange={this.billingAddressValueChanged}
                        className={this.formClass('address.country')}
                      >
                        {Object.keys(customer.country_list).map((key) =>
                          <option key={key} value={customer.country_list[key]}>{customer.country_list[key]}</option>
                        )}
                      </select>
                      {this.errorMessage('address.country')}
                    </div>
                  </div>
                  <div className='col-md-6'>
                    <label className='form-control-label'>Zipcode</label>
                    <input
                      type='text'
                      name='zipcode'
                      value={address.zipcode}
                      onChange={this.addressValueChanged}
                      className={this.formClass('address.zipcde')}
                    />
                    {this.errorMessage('address.zipcode')}
                  </div>
                </div>
              </div>
              <div className='col-md-6'>
                <div className='secondary-header'>Billing Address</div>
                <div className='form-group'>
                  <label className='form-control-label'>Address Line 1</label>
                  <input
                    type='text'
                    name='address_line_1'
                    value={billing_address.address_line_1}
                    onChange={this.billingAddressValueChanged}
                    className={this.formClass('billing_address.address_line_1')}
                  />
                  {this.errorMessage('billing_address.address_line_1')}
                </div>
                <div className='row'>
                  <div className='col-md-8'>
                    <div className='form-group'>
                      <label className='form-control-label'>City</label>
                      <input
                        type='text'
                        name='city'
                        value={billing_address.city}
                        onChange={this.billingAddressValueChanged}
                        className={this.formClass('billing_address.city')}
                      />
                      {this.errorMessage('billing_address.city')}
                    </div>
                  </div>
                  <div className='col-md-4'>
                    <label className='form-control-label'>State/Province</label>
                    <select
                      name='state_province'
                      value={billing_address.state_province}
                      onChange={this.billingAddressValueChanged}
                      className={this.formClass('billing_address.state_province')}
                    >
                      {Object.keys(customer.state_list).map((key) =>
                        <option key={key} value={key}>{`${key}, ${customer.state_list[key]}`}</option>
                      )}
                    </select>
                    {this.errorMessage('billing_address.state_province')}
                  </div>
                </div>
                <div className='row'>
                  <div className='col-md-6'>
                    <div className='form-group'>
                      <label className='form-control-label'>Country</label>
                      <select
                        name='country'
                        value={billing_address.country}
                        onChange={this.billingAddressValueChanged}
                        className={this.formClass('billing_address.country')}
                      >
                        {Object.keys(customer.country_list).map((key) =>
                          <option key={key} value={customer.country_list[key]}>{customer.country_list[key]}</option>
                        )}
                      </select>
                      {this.errorMessage('billing_address.country')}
                    </div>
                  </div>
                  <div className='col-md-6'>
                    <label className='form-control-label'>Zipcode</label>
                    <input
                      type='text'
                      name='zipcode'
                      value={billing_address.zipcode}
                      onChange={this.billingAddressValueChanged}
                      className={this.formClass('billing_address.zipcode')}
                    />
                    {this.errorMessage('billing_address.zipcode')}
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div className='col-md-4'>
            <div className='form-group'>
              <label className='form-control-label'>Phone</label>
              <input
                type='text'
                name='phone'
                value={customer.phone}
                onChange={this.customerValueChanged}
                className={this.formClass('phone')}
              />
              {this.errorMessage('phone')}
            </div>
            <div className='form-group'>
              <label className='form-control-label'>Toll Free</label>
              <input
                type='text'
                name='toll_free'
                value={customer.toll_free}
                onChange={this.customerValueChanged}
                className={this.formClass('toll_free')}
              />
              {this.errorMessage('toll_free')}
            </div>
            <div className='form-group'>
              <label className='form-control-label'>Fax</label>
              <input
                type='text'
                name='fax'
                value={customer.fax}
                onChange={this.customerValueChanged}
                className={this.formClass('fax')}
              />
              {this.errorMessage('fax')}
            </div>
            <div className='form-group'>
              <label className='form-control-label'>Email</label>
              <input
                type='text'
                name='email'
                value={customer.email}
                onChange={this.customerValueChanged}
                className={this.formClass('email')}
              />
              {this.errorMessage('email')}
            </div>
          </div>
          <div className='col-md-12'>
            <input type='submit' className='btn btn-primary' onClick={this.handleFormSubmit}/>
            <a href='/admin/customers/' className='ml-2 btn btn-danger'>Cancel</a>
          </div>
        </div>
      </div>
    )
  }
}

CustomerForm.defaultProps = {
  customer: {
    name: '',
    email: '',
    phone: '',
    toll_free: '',
    fax: '',
    address: {},
    billing_address: {},
    country_list: {},
    state_list: {}
  },
  errors: {}
}

CustomerForm.propTypes = {
  customer: PropTypes.shape({
    name: PropTypes.string,
    email: PropTypes.string,
    phone: PropTypes.string,
    toll_free: PropTypes.string,
    fax: PropTypes.string,
    address: PropTypes.object,
    billing_address: PropTypes.object,
    country_list: PropTypes.object,
    state_list: PropTypes.object,
  }),
  errors: PropTypes.object
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('react-mount')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(
    <CustomerForm {...data} />,
    node
  )
})