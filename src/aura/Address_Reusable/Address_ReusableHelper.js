({
	saveAddressHelper : function(component, helper){
		var addressRec = component.get("v.addressRec");
		var delim = ';';
		var dDelim = ', ';
        var allValuesList = [];
        var nonBlankValuesList = [];
        var fields = ['StreetLine1__c', 'StreetLine2__c', 'StreetLine3__c', 'City__c', 'State__c', 'PostalCode__c', 'Country__c'];
        var reqFields = ['StreetLine1__c', 'City__c', 'PostalCode__c', 'Country__c'];
        for(var i = 0; i < fields.length; i++){
            if(addressRec[fields[i]] === undefined || addressRec[fields[i]] === null || addressRec[fields[i]] === ''){
                allValuesList.push('');
            } else{
                allValuesList.push(addressRec[fields[i]]);
                nonBlankValuesList.push(addressRec[fields[i]]);
            }
        }
        
        var showErrors = false;
        if(component.get("v.required")){
            for(var i = 0; i < reqFields.length; i++){
                if($A.util.isUndefinedOrNull(addressRec[reqFields[i]]) || addressRec[reqFields[i]] === ''){
                    addressRec[reqFields[i]] = '';
                    showErrors = true;
                }
            }
            if(($A.util.isUndefinedOrNull(addressRec.State__c) || addressRec.State__c === '') && !component.get("v.noState")){
                showErrors = true;
            }
            component.set('v.showError', showErrors);
        }
        if(!showErrors){
            component.set("v.returnText", allValuesList.join(";"));
        	component.set("v.displayValue", nonBlankValuesList.join(", "));
            helper.hideModalHelper(component);
        }
	}, 
	hideModalHelper : function(component) {
		component.set("v.showPopup", false);
	}
})