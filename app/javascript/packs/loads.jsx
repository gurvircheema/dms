import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";

import LoadsTable from "../components/LoadsTable";

const Loads = props => {
  const {
    loads: { data }
  } = props;
  return (
    <div className="wrapper">
      {data && data.length > 0 ? (
        <LoadsTable loads={data} />
      ) : (
        <p>There are no loads</p>
      )}
    </div>
  );
};

Loads.propTypes = {
  loads: PropTypes.shape({
    data: PropTypes.array
  }).isRequired
};

document.addEventListener("DOMContentLoaded", () => {
  const mountNode = document.getElementById("react-loads");
  const data = JSON.parse(mountNode.getAttribute("data"));

  ReactDOM.render(<Loads loads={data} />, mountNode);
});
