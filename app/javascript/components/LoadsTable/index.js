import React from "react";
import PropTypes from "prop-types";

import LoadsTableRow from "../LoadsTableRow";

class LoadsTable extends React.Component {
  constructor(props) {
    super(props);
    const { loads } = this.props;
    const expandedLoads = loads.map(load => ({ ...load, expanded: false }));
    this.state = {
      loads: expandedLoads
    };
    this.rowClickHandler = this.rowClickHandler.bind(this);
  }

  rowClickHandler(loadId) {
    this.setState(state => {
      const loads = state.loads.map(load =>
        load.id === loadId ? { ...load, expanded: !load.expanded } : load
      );
      return { loads };
    });
  }

  render() {
    const { loads } = this.state;
    return (
      <div className="table-responsive small">
        <table className="table table-sm table-bordered">
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
            {loads.map(load => (
              <LoadsTableRow
                key={load.id}
                load={load}
                rowClickHandler={this.rowClickHandler}
              />
            ))}
          </tbody>
        </table>
      </div>
    );
  }
}

LoadsTable.propTypes = {
  loads: PropTypes.arrayOf(PropTypes.shape({}))
};

LoadsTable.defaultProps = {
  loads: []
};

export default LoadsTable;
