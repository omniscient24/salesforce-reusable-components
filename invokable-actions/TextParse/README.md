# TextParse - Invokable Action for Salesforce Flow

## Overview

TextParse is a powerful invokable action that parses semicolon-delimited text into a collection variable for use in Salesforce Flows. This component is particularly useful when dealing with data from integrations, CSV imports, or multi-select scenarios.

## Features

- ✅ Parses semicolon-delimited strings into collections
- ✅ Automatically trims whitespace from values
- ✅ Ignores empty values between delimiters
- ✅ Handles null/empty inputs gracefully
- ✅ Supports special characters in values
- ✅ Bulk-safe (processes multiple inputs efficiently)
- ✅ 100% test coverage

## Installation

### Prerequisites
- Salesforce CLI installed
- Access to target Salesforce org
- System Administrator or equivalent permissions

### Deploy to Your Org

1. Navigate to this component's directory:
```bash
cd invokable-actions/TextParse
```

2. Deploy the component:
```bash
sf project deploy start --source-dir src --target-org YOUR_ORG_ALIAS
```

3. Run tests to verify:
```bash
sf apex test run --class-names TextParseTest --target-org YOUR_ORG_ALIAS --code-coverage
```

## Usage in Flow Builder

### Adding to Your Flow

1. In Flow Builder, add an **Action** element
2. Search for **"Parse Text Variables"**
3. Configure the input:
   - **Input Text**: Your semicolon-delimited string
4. Store the output:
   - **Parsed Values**: Collection variable to store results

### Example Use Cases

#### Use Case 1: Processing Multi-Select Picklist Values
```
Input: "Option1;Option2;Option3"
Output: ["Option1", "Option2", "Option3"]
```

#### Use Case 2: Parsing Integration Data
```
Input: "Product1;Product2;;Product3"
Output: ["Product1", "Product2", "Product3"]
(Note: Empty value ignored)
```

#### Use Case 3: Email List Processing
```
Input: "user1@example.com; user2@example.com ; user3@example.com"
Output: ["user1@example.com", "user2@example.com", "user3@example.com"]
(Note: Spaces automatically trimmed)
```

## Flow Example

```yaml
Flow: Process_Delimited_Input
  1. Screen: Collect user input (text field)
  2. Action: Parse Text Variables
     - Input Text: {!UserInput}
  3. Loop: Process each parsed value
     - Collection Variable: {!ParsedValues}
  4. Action in Loop: Create records or send emails
```

## API Details

### Input Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| inputText | String | Yes | Semicolon-delimited text to parse |

### Output Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| parsedValues | List<String> | Collection of parsed text values |

## Test Coverage

The component includes comprehensive test coverage:

- ✅ Single value parsing
- ✅ Multiple values parsing
- ✅ Values with spaces (trimming)
- ✅ Empty values handling
- ✅ Null input handling
- ✅ Empty string handling
- ✅ Multiple inputs (bulk)
- ✅ Special characters support

**Coverage**: 100%

## Technical Details

- **API Version**: 59.0
- **Namespace**: None (works in any org)
- **Governor Limits**: Minimal impact
- **Bulk Safe**: Yes

## Limitations

- Delimiter is fixed to semicolon (;)
- Maximum string length subject to Salesforce limits (6,000,000 characters)
- Collection size subject to Flow collection limits (10,000 items)

## Troubleshooting

### Issue: Values not being parsed
**Solution**: Ensure your input uses semicolons (;) not commas or other delimiters

### Issue: Extra spaces in output
**Solution**: The component automatically trims spaces. Check for non-breaking spaces or special characters

### Issue: Empty values in collection
**Solution**: The component filters out empty values. This is by design.

## Version History

| Version | Date | Changes |
|---------|------|---------||
| 1.0 | Aug 2025 | Initial release |

## Support

For issues or questions, please open an issue in the repository.

## License

MIT License - See repository LICENSE file