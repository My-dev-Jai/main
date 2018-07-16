({
	doInitHelper : function(component){
		var concatenatedAddress = component.get("v.concatenatedText");
        var nonBlankValuesList = [];
        var fields = ['StreetLine1__c', 'StreetLine2__c', 'StreetLine3__c', 'City__c', 'State__c', 'PostalCode__c', 'Country__c'];
		var addressRec = component.get("v.addressRec");
        if(component.get("v.isAddressRec")){
            var allValuesList = [];
            for(var i = 0; i < fields.length; i++){
                if(addressRec[fields[i]] !== undefined && addressRec[fields[i]] !== null && addressRec[fields[i]] !== ''){
                	nonBlankValuesList.push(addressRec[fields[i]]);
                    allValuesList.push(addressRec[fields[i]]);
                } else{
                    allValuesList.push('');
                }
            }
            component.set("v.concatenatedText", allValuesList.join(";"));
        } else if(concatenatedAddress !== undefined && concatenatedAddress !== null && concatenatedAddress !== ''){
			var allElems = concatenatedAddress.split(";");
			for(var i = 0; i < fields.length; i++){
				addressRec[fields[i]] = allElems[i];
                if(addressRec[fields[i]] !== undefined && addressRec[fields[i]] !== null && addressRec[fields[i]] !== ''){
                	nonBlankValuesList.push(addressRec[fields[i]]);
            	}
			}
			component.set("v.addressRec", addressRec);
        }
        component.set("v.displayValue", nonBlankValuesList.join(", "));
	},
	showModalHelper : function(component) {
		component.set("v.showPopup", true);
	}
})