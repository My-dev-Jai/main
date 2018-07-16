({
	saveAddress : function(component, event, helper) {
    	helper.saveAddressHelper(component, helper);
	},
	hideModal : function(component, event, helper) {
		helper.hideModalHelper(component);
	},
    loadPicklists : function(component, event, helper) {
        var fetchPickList = $A.get("e.c:fetchPicklist");
        if(fetchPickList!=undefined){
		fetchPickList.fire();
    }
    }
})