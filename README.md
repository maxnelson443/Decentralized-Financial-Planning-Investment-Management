# Decentralized Financial Planning Investment Management

A comprehensive decentralized finance (DeFi) platform built on Stacks blockchain using Clarity smart contracts for investment management, portfolio optimization, and automated rebalancing.

## 🚀 Features

### Core Components

1. **Investment Manager Verification** (`investment-manager-verification.clar`)
    - Validates and manages investment managers
    - Tracks credentials and reputation scores
    - Maintains manager statistics and performance ratings

2. **Portfolio Optimization** (`portfolio-optimization.clar`)
    - Creates and optimizes investment portfolios
    - Risk-based asset allocation (Conservative, Moderate, Aggressive)
    - Supports multiple asset classes (stocks, bonds, cash)

3. **Risk Assessment** (`risk-assessment.clar`)
    - Comprehensive portfolio risk analysis
    - Volatility, liquidity, and concentration risk metrics
    - Asset-specific risk parameters and VaR calculations

4. **Performance Tracking** (`performance-tracking.clar`)
    - Real-time performance monitoring
    - Benchmark comparison and alpha calculation
    - Historical performance records and analytics

5. **Rebalancing Automation** (`rebalancing-automation.clar`)
    - Automated portfolio rebalancing
    - Configurable thresholds and frequencies
    - Scheduled and trigger-based rebalancing

## 🏗️ Architecture

\`\`\`
contracts/
├── investment-manager-verification.clar
├── portfolio-optimization.clar
├── risk-assessment.clar
├── performance-tracking.clar
└── rebalancing-automation.clar
\`\`\`

## 📋 Prerequisites

- Stacks blockchain node
- Clarity CLI tools
- Node.js (for testing)
- Vitest (for running tests)

## 🛠️ Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd defi-investment-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Deploy contracts to Stacks blockchain:
   \`\`\`bash
# Deploy each contract individually
clarinet deploy --network testnet
\`\`\`

## 🧪 Testing

Run the test suite using Vitest:

\`\`\`bash
npm test
\`\`\`

Tests cover:
- Contract deployment and initialization
- Manager verification workflows
- Portfolio creation and optimization
- Risk assessment calculations
- Performance tracking accuracy
- Rebalancing automation logic

## 📖 Usage Examples

### 1. Verify an Investment Manager

\`\`\`clarity
(contract-call? .investment-manager-verification verify-manager
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK
0x1234567890abcdef)
\`\`\`

### 2. Create and Optimize a Portfolio

\`\`\`clarity
;; Create portfolio with moderate risk tolerance
(contract-call? .portfolio-optimization create-portfolio u5 u8 u120)

;; Optimize the portfolio
(contract-call? .portfolio-optimization optimize-portfolio tx-sender)
\`\`\`

### 3. Assess Portfolio Risk

\`\`\`clarity
(contract-call? .risk-assessment assess-portfolio-risk
tx-sender
(list "stocks" "bonds" "cash"))
\`\`\`

### 4. Track Performance

\`\`\`clarity
(contract-call? .performance-tracking record-performance
tx-sender
u1
12 ;; 12% return
8)  ;; 8% benchmark return
    \`\`\`

### 5. Set Up Automated Rebalancing

\`\`\`clarity
;; Set 5% threshold, rebalance every 1000 blocks
(contract-call? .rebalancing-automation set-rebalancing-rules u5 u1000)
\`\`\`

## 🔧 Configuration

### Risk Tolerance Levels
- **1-3**: Conservative (60% bonds, 30% stocks, 10% cash)
- **4-7**: Moderate (50% stocks, 40% bonds, 10% cash)
- **8-10**: Aggressive (70% stocks, 20% bonds, 10% cash)

### Rebalancing Triggers
- Threshold-based: When allocation drifts beyond set percentage
- Time-based: Minimum blocks between rebalancing
- Manual: On-demand rebalancing

## 🔒 Security Features

- Owner-only functions for critical operations
- Input validation and error handling
- Comprehensive access controls
- Audit trail for all transactions

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation wiki

## 🗺️ Roadmap

- [ ] Integration with external price feeds
- [ ] Advanced portfolio analytics
- [ ] Multi-signature wallet support
- [ ] Mobile application interface
- [ ] Institutional features and compliance tools

---

**Disclaimer**: This software is for educational and development purposes. Always conduct thorough testing and security audits before deploying to mainnet.
