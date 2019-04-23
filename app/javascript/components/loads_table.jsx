import React from 'react'
import PropTypes from 'prop-types'

const LoadsTable = ({loads}) => {
  return (
    <div className='table-responsive small'>
      <table className='table table-sm table-bordered'>
        <thead>
          <tr>
            <th>ID</th>
            <th>Customer</th>
            <th>Pickup</th>
            <th>Drop</th>
            <th>Reference</th>
            <th>Customer Rate</th>
            <th>Vendor/Driver</th>
            <th>View Details</th>
          </tr>
        </thead>
        <tbody>
          {loads.map((load, idx) =>
            <tr key={idx}>
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
                <a href={`/admin/loads/${load.id}`} className='btn btn-xs btn-outline-primary'>Details</a>
              </td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  )
}

LoadsTable.propTypes = {
  loads: PropTypes.array
}

export default LoadsTable;
