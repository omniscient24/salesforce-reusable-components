# Salesforce Reusable Components Library

A collection of reusable Salesforce components designed for cross-client implementation. These components have been tested and proven in production environments.

## 📚 Table of Contents
- [Invokable Actions](#invokable-actions)
- [Apex Utilities](#apex-utilities)
- [Lightning Web Components](#lightning-web-components)
- [Aura Components](#aura-components)
- [Installation](#installation)
- [Contributing](#contributing)

## 🎯 Invokable Actions

### TextParse
**Location**: `/invokable-actions/TextParse/`

**Description**: Parse semicolon-delimited text into a collection variable for use in Salesforce Flows.

**Use Cases**:
- Converting delimited strings from integrations into usable collections
- Processing multi-select picklist values
- Handling batch input from external systems

**Features**:
- Handles empty values gracefully
- Trims whitespace automatically
- Supports special characters
- 100% test coverage

[View Documentation](./invokable-actions/TextParse/README.md)

## 🛠 Apex Utilities

### CurrencySelectionService
**Location**: `/apex-utilities/CurrencySelectionService/`

**Description**: Intelligent currency selection based on user preferences and geographic location.

**Features**:
- User default currency detection
- Country-based currency mapping
- Order status validation for currency changes

[View Documentation](./apex-utilities/CurrencySelectionService/README.md)

## ⚡ Lightning Web Components

*Coming soon*

## 🌟 Aura Components

### RefreshPage
**Location**: `/aura-components/RefreshPage/`

**Description**: Simple component to refresh the current page from a Flow.

[View Documentation](./aura-components/RefreshPage/README.md)

## 📦 Installation

Each component can be deployed independently. Navigate to the specific component folder for detailed installation instructions.

### General Deployment Steps:

1. Clone this repository:
```bash
git clone https://github.com/omniscient24/salesforce-reusable-components.git
```

2. Navigate to the desired component folder:
```bash
cd invokable-actions/TextParse
```

3. Deploy using Salesforce CLI:
```bash
sf project deploy start --source-dir . --target-org YOUR_ORG_ALIAS
```

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

1. Each component should include:
   - Source code
   - Test classes with >75% coverage
   - README with usage instructions
   - Example implementation

2. Follow Salesforce best practices:
   - Bulkified code
   - Proper error handling
   - Clear documentation
   - Meaningful test cases

3. Directory structure:
```
component-type/
└── ComponentName/
    ├── README.md
    ├── src/
    │   ├── classes/
    │   └── ...
    ├── tests/
    └── examples/
```

## 📝 License

MIT License - See [LICENSE](./LICENSE) file for details.

## 🏢 Client Usage

These components have been successfully implemented at:
- Fortra
- *Your organization here*

## 📞 Support

For questions or support, please open an issue in this repository.

---

**Last Updated**: August 2025
**Maintained By**: Marc DeBrey & Team