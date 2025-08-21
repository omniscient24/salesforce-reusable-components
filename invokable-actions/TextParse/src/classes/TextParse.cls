public class TextParse {
    
    @InvocableMethod(label='Parse Text Variables' 
                     description='Parse semicolon-delimited text into a collection variable')
    public static List<OutputWrapper> parseText(List<InputWrapper> inputs) {
        List<OutputWrapper> outputs = new List<OutputWrapper>();
        
        for (InputWrapper input : inputs) {
            OutputWrapper output = new OutputWrapper();
            output.parsedValues = new List<String>();
            
            if (String.isNotBlank(input.inputText)) {
                // Split by semicolon and trim each value
                List<String> values = input.inputText.split(';');
                for (String value : values) {
                    String trimmedValue = value.trim();
                    if (String.isNotBlank(trimmedValue)) {
                        output.parsedValues.add(trimmedValue);
                    }
                }
            }
            
            outputs.add(output);
        }
        
        return outputs;
    }
    
    public class InputWrapper {
        @InvocableVariable(label='Input Text' 
                          description='Semicolon-delimited text to parse' 
                          required=true)
        public String inputText;
    }
    
    public class OutputWrapper {
        @InvocableVariable(label='Parsed Values' 
                          description='Collection of parsed text values')
        public List<String> parsedValues;
    }
}