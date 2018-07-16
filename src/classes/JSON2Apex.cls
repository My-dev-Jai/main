public class JSON2Apex {

    public class JSON2Apex2 {
        public links links;
        public String rel;
    }

    public class links {
        public Self self;
        public Self myApplications;
        public Self myOnlineMeetings;
        public Self serviceapplications;
        public Self applications;
    }

    public class Self {
        public String href;
    }

    
    public static JSON2Apex2 parse(String json) {
        return (JSON2Apex2) System.JSON.deserialize(json, JSON2Apex.class);
    }
}