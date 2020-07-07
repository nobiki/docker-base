import React, { Component } from "react";
import Helmet from "react-helmet"

import Nav from "./myapp/Nav"
import Main from "./myapp/Main"
import Footer from "./myapp/Footer"

class Myapp extends Component {

  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div id="app">
        <header>
        <Helmet title="Myapp Title" />
          <Nav></Nav>
          <Main></Main>
          <Footer></Footer>
        </header>
      </div>
    );
  }
}
export default Myapp;
