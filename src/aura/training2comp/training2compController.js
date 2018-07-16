({
    fireComponentEvent : function(cmp, event) {
        // Get the component event by using the
        // name value from aura:registerEvent
        console.log('here');
        var cmpEvent = cmp.getEvent("MyComponentEvent");
        cmpEvent.setParams({
            "message" : "A component event fired me. " +
            "It all happened so fast. Now, I'm here!" });
        console.log('here'+cmpEvent);
        cmpEvent.fire();
    }
})