import React from 'react';
import PropTypes from 'prop-types';

const statusStyle = {
  display: 'flex',
  flexDirection: 'column',
};

const greenStyle = {
  color: 'green',
};

const redStyle = {
  color: 'red',
};

const Status = load => (
  <span style={statusStyle}>
    <span style={load.picked_up ? greenStyle : redStyle}>Picked Up</span>
    <span style={load.picked_up ? greenStyle : redStyle}>Delivered</span>
    <span style={load.picked_up ? greenStyle : redStyle}>Invoiced</span>
    <span style={load.picked_up ? greenStyle : redStyle}>Payment Received</span>
    <span style={load.picked_up ? greenStyle : redStyle}>Paid To Vendor</span>
  </span>
);

const LoadsTableRow = ({ load, rowClickHandler }) => (
  <React.Fragment>
    <tr onClick={() => rowClickHandler(load.id)}>
      <td>{load.id}</td>
      <td>{load.attributes.customer_name}</td>
      <td>{load.attributes.pickup_location}</td>
      <td>{load.attributes.dropoff_location}</td>
      <td>{load.attributes.customer_ref_number}</td>
      <td>{load.attributes.customer_rate}</td>
      <td>
        {load.attributes.vendor_name
          ? `${load.attributes.vendor_name} (Vendor)`
          : `${load.attributes.driver_name} (Driver)`
        }
      </td>
      <td>
        <a href={`/admin/loads/${load.id}`} className="btn btn-xs btn-outline-primary">Details</a>
      </td>
    </tr>
    {load.expanded && (
      <React.Fragment>
        <tr>
          <td />
          <td>
            <b>Equipment</b>
            {load.equipment_type}
          </td>
          <td>
            <b>Status</b>
            <Status load={load} />
          </td>
          <td>
            <b>Vendor Cost</b>
            {load.vendor_cost}
          </td>
          <td colSpan="3">
            <b>Customer Notes</b>
            {load.customer_notes}
          </td>
          <td />
        </tr>
      </React.Fragment>
    )}
  </React.Fragment>
);

LoadsTableRow.propTypes = {
  load: PropTypes.shape({}).isRequired,
  rowClickHandler: PropTypes.func.isRequired,
};

export default LoadsTableRow;
