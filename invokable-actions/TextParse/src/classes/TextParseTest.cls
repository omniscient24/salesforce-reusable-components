@isTest
public class TextParseTest {
    
    @isTest
    static void testParseTextWithSingleValue() {
        // Setup
        TextParse.InputWrapper input = new TextParse.InputWrapper();
        input.inputText = 'Value1';
        List<TextParse.InputWrapper> inputs = new List<TextParse.InputWrapper>{input};
        
        // Execute
        Test.startTest();
        List<TextParse.OutputWrapper> outputs = TextParse.parseText(inputs);
        Test.stopTest();
        
        // Verify
        System.assertEquals(1, outputs.size(), 'Should return one output');
        System.assertEquals(1, outputs[0].parsedValues.size(), 'Should have one parsed value');
        System.assertEquals('Value1', outputs[0].parsedValues[0], 'Should parse single value correctly');
    }
    
    @isTest
    static void testParseTextWithMultipleValues() {
        // Setup
        TextParse.InputWrapper input = new TextParse.InputWrapper();
        input.inputText = 'Value1;Value2;Value3';
        List<TextParse.InputWrapper> inputs = new List<TextParse.InputWrapper>{input};
        
        // Execute
        Test.startTest();
        List<TextParse.OutputWrapper> outputs = TextParse.parseText(inputs);
        Test.stopTest();
        
        // Verify
        System.assertEquals(1, outputs.size(), 'Should return one output');
        System.assertEquals(3, outputs[0].parsedValues.size(), 'Should have three parsed values');
        System.assertEquals('Value1', outputs[0].parsedValues[0], 'First value should be Value1');
        System.assertEquals('Value2', outputs[0].parsedValues[1], 'Second value should be Value2');
        System.assertEquals('Value3', outputs[0].parsedValues[2], 'Third value should be Value3');
    }
    
    @isTest
    static void testParseTextWithSpaces() {
        // Setup
        TextParse.InputWrapper input = new TextParse.InputWrapper();
        input.inputText = ' Value1 ; Value2 ; Value3 ';
        List<TextParse.InputWrapper> inputs = new List<TextParse.InputWrapper>{input};
        
        // Execute
        Test.startTest();
        List<TextParse.OutputWrapper> outputs = TextParse.parseText(inputs);
        Test.stopTest();
        
        // Verify
        System.assertEquals(1, outputs.size(), 'Should return one output');
        System.assertEquals(3, outputs[0].parsedValues.size(), 'Should have three parsed values');
        System.assertEquals('Value1', outputs[0].parsedValues[0], 'Should trim spaces from first value');
        System.assertEquals('Value2', outputs[0].parsedValues[1], 'Should trim spaces from second value');
        System.assertEquals('Value3', outputs[0].parsedValues[2], 'Should trim spaces from third value');
    }
    
    @isTest
    static void testParseTextWithEmptyValues() {
        // Setup
        TextParse.InputWrapper input = new TextParse.InputWrapper();
        input.inputText = 'Value1;;Value3;';
        List<TextParse.InputWrapper> inputs = new List<TextParse.InputWrapper>{input};
        
        // Execute
        Test.startTest();
        List<TextParse.OutputWrapper> outputs = TextParse.parseText(inputs);
        Test.stopTest();
        
        // Verify
        System.assertEquals(1, outputs.size(), 'Should return one output');
        System.assertEquals(2, outputs[0].parsedValues.size(), 'Should ignore empty values');
        System.assertEquals('Value1', outputs[0].parsedValues[0], 'First value should be Value1');
        System.assertEquals('Value3', outputs[0].parsedValues[1], 'Second value should be Value3');
    }
    
    @isTest
    static void testParseTextWithNullInput() {
        // Setup
        TextParse.InputWrapper input = new TextParse.InputWrapper();
        input.inputText = null;
        List<TextParse.InputWrapper> inputs = new List<TextParse.InputWrapper>{input};
        
        // Execute
        Test.startTest();
        List<TextParse.OutputWrapper> outputs = TextParse.parseText(inputs);
        Test.stopTest();
        
        // Verify
        System.assertEquals(1, outputs.size(), 'Should return one output');
        System.assertEquals(0, outputs[0].parsedValues.size(), 'Should return empty list for null input');
    }
    
    @isTest
    static void testParseTextWithEmptyString() {
        // Setup
        TextParse.InputWrapper input = new TextParse.InputWrapper();
        input.inputText = '';
        List<TextParse.InputWrapper> inputs = new List<TextParse.InputWrapper>{input};
        
        // Execute
        Test.startTest();
        List<TextParse.OutputWrapper> outputs = TextParse.parseText(inputs);
        Test.stopTest();
        
        // Verify
        System.assertEquals(1, outputs.size(), 'Should return one output');
        System.assertEquals(0, outputs[0].parsedValues.size(), 'Should return empty list for empty string');
    }
    
    @isTest
    static void testParseTextWithMultipleInputs() {
        // Setup
        TextParse.InputWrapper input1 = new TextParse.InputWrapper();
        input1.inputText = 'A;B;C';
        TextParse.InputWrapper input2 = new TextParse.InputWrapper();
        input2.inputText = 'X;Y;Z';
        List<TextParse.InputWrapper> inputs = new List<TextParse.InputWrapper>{input1, input2};
        
        // Execute
        Test.startTest();
        List<TextParse.OutputWrapper> outputs = TextParse.parseText(inputs);
        Test.stopTest();
        
        // Verify
        System.assertEquals(2, outputs.size(), 'Should return two outputs');
        System.assertEquals(3, outputs[0].parsedValues.size(), 'First output should have three values');
        System.assertEquals(3, outputs[1].parsedValues.size(), 'Second output should have three values');
        System.assertEquals('A', outputs[0].parsedValues[0], 'First value of first output should be A');
        System.assertEquals('X', outputs[1].parsedValues[0], 'First value of second output should be X');
    }
    
    @isTest
    static void testParseTextWithSpecialCharacters() {
        // Setup
        TextParse.InputWrapper input = new TextParse.InputWrapper();
        input.inputText = 'Value@1;Value#2;Value$3';
        List<TextParse.InputWrapper> inputs = new List<TextParse.InputWrapper>{input};
        
        // Execute
        Test.startTest();
        List<TextParse.OutputWrapper> outputs = TextParse.parseText(inputs);
        Test.stopTest();
        
        // Verify
        System.assertEquals(1, outputs.size(), 'Should return one output');
        System.assertEquals(3, outputs[0].parsedValues.size(), 'Should have three parsed values');
        System.assertEquals('Value@1', outputs[0].parsedValues[0], 'Should handle special characters');
        System.assertEquals('Value#2', outputs[0].parsedValues[1], 'Should handle special characters');
        System.assertEquals('Value$3', outputs[0].parsedValues[2], 'Should handle special characters');
    }
}