'use babel'
/** @jsx etch.dom */

import etch from 'etch'

export default class RunnerPanelComponent {
  constructor () {
    console.log("RunnerPanelComponent constructor")
    etch.createElement(this);
  }

  render () {
    console.log("RunnerPanelComponent render")
    return (
      <div className="atom-spec-runner panel">
        <div className="close-icon" />
        <iframe className="frame"/>
      </div>
    )
  }
}
