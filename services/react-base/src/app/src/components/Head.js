import React, { Component } from "react";
import Helmet from "react-helmet"

class Head extends Component {

  render() {
    return (
      <Helmet
        htmlAttributes={{
          lang: "ja"
        }}
        bodyAttributes={{
          id: "top",
        }}
        meta={[
          { "charset": "UTF-8" },
          { "http-equiv": "X-UA-Compatible", "content": "IE=edge" },
          { "name": "viewport", "content": "width=device-width, initial-scale=1" },
          { "name": "description", "content": "this is description" },
        ]}
        title="react-base"
      />
    );
  }
}
export default Head;
