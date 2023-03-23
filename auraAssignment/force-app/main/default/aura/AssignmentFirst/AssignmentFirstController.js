({
    doInit : function(component, event, helper) {
        var accountId = component.get("v.recordId");
        var action = component.get("c.getContactWrappers");
        action.setParams({ accountId : accountId });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var wrappers = response.getReturnValue();
                component.set("v.contactWrappers", wrappers);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    }
})