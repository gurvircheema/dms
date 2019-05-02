import React from 'react';
import PropTypes from 'prop-types';

import LoadsTableRow from '../LoadsTableRow';

class LoadsTable extends React.Component {
  constructor(props) {
    super(props)
    const loads = this.props.loads.map( load => ({...load, expanded: false }) )
    this.state = {
      loads: loads
    }
    this.rowClickHandler = this.rowClickHandler.bind(this)
  }

  rowClickHandler(load_id) {
    this.setState(state => {
      const loads = state.loads.map(load => {
        if(load.id === load_id) {
          return {...load, expanded: !load.expanded}
        } else {
          return load
        }
      });

      return {
        loads: loads
      }
    })
  }

  render() {
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
            {this.state.loads.map((load, idx) =>
              <LoadsTableRow
                key={idx}
                load={load}
                rowClickHandler={this.rowClickHandler}
              />
            )}
          </tbody>
        </table>
      </div>
    )
  }
}

LoadsTable.propTypes = {
  loads: PropTypes.array
}

LoadsTable.defaultProps = {
  loads: []
}

export default LoadsTable;
