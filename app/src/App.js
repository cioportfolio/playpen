import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {

  state = { data: "Loading..." };

  async componentDidMount() {
    const res = await fetch('/api/items');
    const data = await res.json();
    const message = JSON.stringify(data, null, 2);
    this.setState({ data: message });
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
          <h1>Hello world</h1>
          <p>
            For further information about this project see
          </p>
          <a
              className="App-link"
              href="https://github.com/cioportfolio/playpen/blob/react/README.md#an-intermediate-web-development-playpen"
              target="_blank"
              rel="noopener noreferrer"
          >
              playpen details on GitHub
          </a>
          <h2>API Test</h2>
          <div>
            {this.state.data}
          </div>
        </header>
      </div>
    );
  }
}

export default App;
