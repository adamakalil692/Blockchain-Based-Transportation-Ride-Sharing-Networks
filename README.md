# Blockchain-Based Transportation Ride-Sharing Network

A decentralized ride-sharing platform built on the Stacks blockchain using Clarity smart contracts. This system provides a trustless, transparent, and secure way to manage ride-sharing operations without relying on centralized authorities.

## 🚀 Features

### Core Components

1. **Platform Operator Verification** - Validates and manages ride-sharing platform operators
2. **Driver Verification** - Handles driver registration, verification, and status management
3. **Ride Matching** - Matches riders with available drivers and manages ride lifecycle
4. **Payment Processing** - Processes payments, handles fees, and manages user balances
5. **Safety Monitoring** - Tracks safety incidents, ratings, and user safety scores

### Key Benefits

- **Decentralized**: No single point of failure or control
- **Transparent**: All transactions and ratings are recorded on-chain
- **Secure**: Smart contract-based logic ensures trustless operations
- **Fair**: Automated fee distribution and dispute resolution
- **Safe**: Built-in safety monitoring and incident reporting

## 📋 Smart Contracts

### 1. Platform Operator (`platform-operator.clar`)
Manages platform operators who oversee ride-sharing operations.

**Key Functions:**
- `register-operator` - Register a new platform operator
- `verify-operator` - Verify an operator (admin only)
- `is-verified-operator` - Check if an operator is verified
- `update-operator-stats` - Update operator statistics

### 2. Driver Verification (`driver-verification.clar`)
Handles driver registration, verification, and availability status.

**Key Functions:**
- `register-driver` - Register as a driver under a platform operator
- `verify-driver` - Verify a driver (operator only)
- `set-driver-availability` - Set driver availability and location
- `is-driver-available` - Check if driver is available for rides

### 3. Ride Matching (`ride-matching.clar`)
Core ride-sharing logic for matching riders with drivers.

**Key Functions:**
- `request-ride` - Request a new ride
- `accept-ride` - Driver accepts a ride request
- `start-ride` - Start an accepted ride
- `complete-ride` - Complete a ride and trigger payment
- `cancel-ride` - Cancel a ride

### 4. Payment Processing (`payment-processing.clar`)
Handles all payment operations and fee distribution.

**Key Functions:**
- `deposit` - Deposit STX tokens to user balance
- `withdraw` - Withdraw STX tokens from user balance
- `process-payment` - Process ride payment with automatic fee distribution
- `refund-payment` - Refund cancelled rides

**Fee Structure:**
- Platform fee: 10% of ride fare
- Driver receives: 90% of ride fare
- Operator fee: 50% of platform fee

### 5. Safety Monitoring (`safety-monitoring.clar`)
Monitors ride safety and handles incident reporting.

**Key Functions:**
- `report-incident` - Report a safety incident
- `rate-ride` - Rate a completed ride
- `resolve-incident` - Resolve reported incidents (operator only)
- `get-user-safety-score` - Get user's safety score

## 🛠 Installation & Setup

### Prerequisites
- [Clarinet](https://github.com/hirosystems/clarinet) - Clarity development environment
- [Node.js](https://nodejs.org/) - For running tests
- [Stacks Wallet](https://www.hiro.so/wallet) - For interacting with contracts

### Local Development

1. **Clone the repository**
   \`\`\`bash
   git clone <repository-url>
   cd blockchain-rideshare
   \`\`\`

2. **Install dependencies**
   \`\`\`bash
   npm install
   \`\`\`

3. **Run tests**
   \`\`\`bash
   npm test
   \`\`\`

4. **Deploy contracts locally**
   \`\`\`bash
   clarinet integrate
   \`\`\`

## 🧪 Testing

The project uses Vitest for testing smart contract functionality. Tests cover:

- Contract deployment and initialization
- User registration and verification flows
- Ride request and matching logic
- Payment processing and fee distribution
- Safety monitoring and incident reporting

Run tests with:
\`\`\`bash
npm test
\`\`\`

## 📖 Usage Examples

### For Platform Operators

1. **Register as an operator**
   \`\`\`clarity
   (contract-call? .platform-operator register-operator "RideShare Co" "RSC-2024-001")
   \`\`\`

2. **Verify a driver**
   \`\`\`clarity
   (contract-call? .driver-verification verify-driver 'SP1234...DRIVER)
   \`\`\`

### For Drivers

1. **Register as a driver**
   \`\`\`clarity
   (contract-call? .driver-verification register-driver
   "John Doe"
   "DL123456"
   "Toyota Camry 2020 - ABC123"
   'SP1234...OPERATOR)
   \`\`\`

2. **Set availability**
   \`\`\`clarity
   (contract-call? .driver-verification set-driver-availability true "Downtown Area")
   \`\`\`

3. **Accept a ride**
   \`\`\`clarity
   (contract-call? .ride-matching accept-ride u1)
   \`\`\`

### For Riders

1. **Deposit funds**
   \`\`\`clarity
   (contract-call? .payment-processing deposit u1000000) ;; 1 STX
   \`\`\`

2. **Request a ride**
   \`\`\`clarity
   (contract-call? .ride-matching request-ride
   "123 Main St"
   "456 Oak Ave"
   u500000) ;; 0.5 STX
   \`\`\`

3. **Rate the ride**
   \`\`\`clarity
   (contract-call? .safety-monitoring rate-ride
   u1
   (some u5)
   (some u5)
   u9
   "Great ride!")
   \`\`\`

## 🔒 Security Considerations

- All contracts include proper authorization checks
- Payment processing uses escrow-like mechanisms
- Safety monitoring provides transparency and accountability
- Fee distribution is automated and transparent
- User balances are tracked on-chain for security

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
- Create an issue in the GitHub repository
- Join our community Discord
- Check the documentation wiki

## 🗺 Roadmap

- [ ] Multi-token payment support
- [ ] Advanced matching algorithms
- [ ] Integration with mapping services
- [ ] Mobile app development
- [ ] Cross-chain compatibility
- [ ] Governance token implementation
  \`\`\`

Now let's create the PR details file:
