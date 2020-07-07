import React, { Component } from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

import axios from "axios";

import "../css/bootstrap.min.css";
import "../css/mdb.min.css";
import "../css/index.css";

import Head from "./Head"
import Myapp from "./Myapp"

class App extends Component {

  constructor(props) {
    super(props);
    this.state = {
      experiences: [],
    };
    this.getData = this.getData.bind(this);
  }

  getData() {
    const url = "//{process.env.REACT_APP_API_SERVER}/get-experiences"
    const config = {}

    axios.get(url, config)
      .then(results => {
        console.log(results.data["Value"]);
        this.setState({
          experiences: results.data["Value"]
        });
      })
      .catch(error => {console.log(error)});
  }

  render() {
    return (
      <Router>
        <Head />

        <Switch>
          <Route path="/">
            <Myapp />
          </Route>
        </Switch>
      </Router>
    );
  }
}
export default App;
