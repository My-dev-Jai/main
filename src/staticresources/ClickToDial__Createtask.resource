var callingTo;
var recordId;
var salesforceSessionId;
var ownerId;
var isAutoLog;

function formatPhone(phoneNumber)
{
	var iChars = "!@#$%^&*()=-[]\\\' ;,./{}|\":<>?";
	var phone = '';
	for (var i = 0; i < phoneNumber.length; i++)
	{
		  if (iChars.indexOf(phoneNumber.charAt(i)) == -1) 
		  {
			   phone = phone + phoneNumber.charAt(i);
		  }
	}
	return phone;	
}

function createTask(callingTo,recordId,salesforceSessionId,isPhone,ownerId,isAutoLog)
	{
		//alert(isAutoLog);		
		if(isPhone)
			this.callingTo = formatPhone(callingTo);
		else
			this.callingTo = callingTo;
			
		this.recordId = recordId ;
		this.ownerId = ownerId;
		this.salesforceSessionId = salesforceSessionId;
		if (isAutoLog.toLowerCase() == 'Yes'.toLowerCase())
		{
			this.isAutoLog = true;
		}
		else
		{
			this.isAutoLog = false;
		}
		
		setTimeout("createTaskAfterDelay()",5000);
	}

function createTaskAfterDelay()
	{
		
		if (isAutoLog)
		{
				//sforce.connection.sessionId = salesforceSessionId;
				//taskId = sforce.apex.execute("ClickToDial.TaskController","CreateTask", {id:recordId,phone:callingTo});
				//location.href = '/'+taskId+'/e?retURL=%2F'+recordId;
				location.href = '/apex/ClickToDial__createtask?contextId='+recordId+'&phone='+callingTo;
		}
		else
		{
			var answer = confirm('Would you like to log this call?');
			var taskId;
			if (answer)
			{
				//sforce.connection.sessionId = salesforceSessionId;
				//taskId = sforce.apex.execute("ClickToDial.TaskController","CreateTask", {id:recordId,phone:callingTo});
				location.href = '/apex/ClickToDial__createtask?contextId='+recordId+'&phone='+callingTo;
				/*var t1= new sforce.SObject("Task" );
				t1.OwnerId = ownerId;//SFDC ID of user record
				t1.Subject = "Call";
				t1.Status = "Completed";
				t1.Priority = "Normal";
				t1.IsReminderSet = true;
				t1.ClickToCallPhone__c = callingTo;
				if (recordId.substring(0,3) == '001')
				{
					t1.whatId  = recordId;
				}
				else
				{
					t1.whoId = recordId;
				}
				var currentTime = new Date();
				var month = currentTime.getMonth() + 1 ;
				var day = currentTime.getDate();
				var year = currentTime.getFullYear();
				//document.write(month + "/" + day + "/" + year)
					
				t1.ActivityDate= new Date(month + "/" + day + "/" + year);
				result = sforce.connection.create([t1]);
				//{id:'00TA000000JWmgGMAT', success:'true', }
				var objJson = eval('(' +result+ ')');

				taskId = objJson.id;*/
				//alert(result );
				//location.href = '/'+taskId+'/e?retURL=%2F'+recordId;
			}
		}
	}