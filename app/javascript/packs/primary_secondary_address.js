// eslint-disable-next-line react/jsx-curly-newline
const getAddressLine = (identifier) =>
  document.querySelector(`#${identifier}_address_line_1`).value;

const getCity = (identifier) =>
  document.querySelector(`#${identifier}_city`).value;

const getStateProvince = (identifier) =>
  document.querySelector(`#${identifier}_state_province`).value;

const getCountry = (identifier) =>
  document.querySelector(`#${identifier}_country`).value;

const getZipcode = (identifier) =>
  document.querySelector(`#${identifier}_zipcode`).value;

const setAddressLine = (identifier, value) => {
  document.querySelector(`#${identifier}_address_line_1`).value = value;
};

const setCity = (identifier, value) => {
  document.querySelector(`#${identifier}_city`).value = value;
};

const setStateProvince = (identifier, value) => {
  document.querySelector(`#${identifier}_state_province`).value = value;
};

const setCountry = (identifier, value) => {
  document.querySelector(`#${identifier}_country`).value = value;
};

const setZipcode = (identifier, value) => {
  document.querySelector(`#${identifier}_zipcode`).value = value;
};

function Address(identifier) {
  this.identifier = identifier;
  this.addressLine = getAddressLine(identifier);
  this.city = getCity(identifier);
  this.stateProvince = getStateProvince(identifier);
  this.country = getCountry(identifier);
  this.zipcode = getZipcode(identifier);
  this.copyFromObject = (object) => {
    this.addressLine = object.addressLine;
    this.city = object.city;
    this.stateProvince = object.stateProvince;
    this.country = object.country;
    this.zipcode = object.zipcode;
    return this;
  };
  this.setDOMValues = () => {
    setAddressLine(this.identifier, this.addressLine);
    setCity(this.identifier, this.city);
    setStateProvince(this.identifier, this.stateProvince);
    setCountry(this.identifier, this.country);
    setZipcode(this.identifier, this.zipcode);
    return this;
  };
}

const sameBillingAddress = document.querySelector('#same_billing_address');
if (sameBillingAddress) {
  sameBillingAddress.addEventListener('change', (e) => {
    e.preventDefault();
    const el = e.target;
    const primaryAddress = new Address('customer_address_attributes');
    const secondaryAddress = new Address('customer_billing_address_attributes');
    if (el.checked) {
      secondaryAddress.copyFromObject(primaryAddress);
      secondaryAddress.setDOMValues();
    }
  });
}

const vendorRemitSameAsPrimaryAddress = document.querySelector(
  '#vendor_remit_same_as_primary_address'
);
if (vendorRemitSameAsPrimaryAddress) {
  vendorRemitSameAsPrimaryAddress.addEventListener('change', (e) => {
    e.preventDefault();
    const el = e.target;
    const primaryAddress = new Address('vendor_address_attributes');
    const secondaryAddress = new Address('vendor_remit_address_attributes');
    if (el.checked) {
      secondaryAddress.copyFromObject(primaryAddress);
      secondaryAddress.setDOMValues();
    }
  });
}
