import React from 'react';
import SockJsClient from 'react-stomp';

class Portfolio {
  constructor(id, allocations=[]) {
    this.id = id;
    this.allocations = allocations;
  }

  addAllocation = (instrument, percent) => {
    this.allocations.push(new Allocation(instrument, percent));
  }

  validate = () => {
    let total = 0.0;
    this.allocations.forEach(alloc => total += alloc.percent);
    if (total > 1.0) {
      console.log('The portfolio is overallocated: ' + total);
    }
  }
}

class Allocation {
  constructor(instrument, percent) {
    this.instrument = instrument;
    this.percent = percent;
  }
}

export default class App extends React.Component {
  constructor(props) {
    super(props);
  }

  sendMessage = (msg) => {
    let p = new Portfolio(1, []);
    p.addAllocation('IBM', 0.5);
    p.addAllocation('AAPL', 0.6);
    p.validate();

    console.log('sending message to /app/portfolio...');

    this.clientRef.sendMessage('/app/portfolio', JSON.stringify(p));
  }

  handleClick = (evt) => {
    this.sendMessage('Rafael');
  }

  render() {
    return (
      <div>
        <SockJsClient url = 'http://localhost:8080/portfolio'
          topics = {
            ['/topic/portfolio-analytics']
          }
          onMessage = {
            (portfolio) => {
              console.log('received from /topic/greeting: ' + JSON.stringify(portfolio));
            }
          }
          ref = {
            (cli) => {
              this.clientRef = cli
            }
          }
        />
        <button onClick={this.handleClick}>
          Test
        </button>
      </div>
    );
  }
}

