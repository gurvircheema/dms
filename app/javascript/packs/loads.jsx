import React from 'react'
import ReactDOM from 'react-dom'

import LoadsTable from '../components/LoadsTable'

const Loads = (props) => {
  const loads = props.loads.data;
  return (
    <div className='wrapper'>
      { loads && loads.length > 0
        ? <LoadsTable loads={loads}/>
        : <p>There are no loads</p>
      }
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const mountNode = document.getElementById('react-loads')
  const data = JSON.parse(mountNode.getAttribute('data'))

  ReactDOM.render(
    <Loads loads={data}/>,
    mountNode
  )
})
