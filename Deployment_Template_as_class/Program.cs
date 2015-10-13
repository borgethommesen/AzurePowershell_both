using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deployment_Template_as_class
{
    public class Rootobject
    {
        public string id { get; set; }
        public string schema { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public string type { get; set; }
        public Properties properties { get; set; }
        public bool additionalProperties { get; set; }
        public string[] required { get; set; }
        public Definitions definitions { get; set; }
    }

    public class Properties
    {
        public Schema schema { get; set; }
        public Contentversion contentVersion { get; set; }
        public Variables variables { get; set; }
        public Parameters parameters { get; set; }
        public Resources resources { get; set; }
        public Outputs outputs { get; set; }
    }

    public class Schema
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Contentversion
    {
        public string type { get; set; }
        public string pattern { get; set; }
        public string description { get; set; }
    }

    public class Variables
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Parameters
    {
        public string type { get; set; }
        public string description { get; set; }
        public Additionalproperties additionalProperties { get; set; }
    }

    public class Additionalproperties
    {
        public string _ref { get; set; }
    }

    public class Resources
    {
        public string type { get; set; }
        public string description { get; set; }
        public Items items { get; set; }
        public int minItems { get; set; }
    }

    public class Items
    {
        public Oneof[] oneOf { get; set; }
    }

    public class Oneof
    {
        public Allof[] allOf { get; set; }
    }

    public class Allof
    {
        public string _ref { get; set; }
        public Oneof1[] oneOf { get; set; }
    }

    public class Oneof1
    {
        public string _ref { get; set; }
    }

    public class Outputs
    {
        public string type { get; set; }
        public string description { get; set; }
        public Additionalproperties1 additionalProperties { get; set; }
    }

    public class Additionalproperties1
    {
        public string _ref { get; set; }
    }

    public class Definitions
    {
        public Resourcebase resourceBase { get; set; }
        public Armresourcebase ARMResourceBase { get; set; }
        public Proxyresourcebase proxyResourceBase { get; set; }
        public Resourcebaseforparentresources resourceBaseForParentResources { get; set; }
        public Resourcebaseexternal resourceBaseExternal { get; set; }
        public Childresources childResources { get; set; }
        public Armchildresources ARMChildResources { get; set; }
        public Resourcesku resourceSku { get; set; }
        public Resourcecopy resourceCopy { get; set; }
        public Resourceplan resourcePlan { get; set; }
        public Resourcelocations resourceLocations { get; set; }
        public Parameter parameter { get; set; }
        public Output output { get; set; }
        public Parametertypes parameterTypes { get; set; }
        public Parametervaluetypes parameterValueTypes { get; set; }
        public Expression expression { get; set; }
        public Iso8601duration Iso8601Duration { get; set; }
        public UTC UTC { get; set; }
        public Apiversion1 apiVersion { get; set; }
    }

    public class Resourcebase
    {
        public Allof1[] allOf { get; set; }
    }

    public class Allof1
    {
        public string _ref { get; set; }
        public Properties1 properties { get; set; }
    }

    public class Properties1
    {
        public Resources1 resources { get; set; }
    }

    public class Resources1
    {
        public string _ref { get; set; }
    }

    public class Armresourcebase
    {
        public string type { get; set; }
        public Properties2 properties { get; set; }
        public string[] required { get; set; }
    }

    public class Properties2
    {
        public Name name { get; set; }
        public Type type { get; set; }
        public Apiversion apiVersion { get; set; }
        public Dependson dependsOn { get; set; }
    }

    public class Name
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Type
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Apiversion
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Dependson
    {
        public string type { get; set; }
        public Items1 items { get; set; }
        public string description { get; set; }
    }

    public class Items1
    {
        public string type { get; set; }
    }

    public class Proxyresourcebase
    {
        public Allof2[] allOf { get; set; }
    }

    public class Allof2
    {
        public string _ref { get; set; }
        public Properties3 properties { get; set; }
    }

    public class Properties3
    {
        public Resources2 resources { get; set; }
        public Location location { get; set; }
    }

    public class Resources2
    {
        public string _ref { get; set; }
    }

    public class Location
    {
        public string _ref { get; set; }
        public string description { get; set; }
    }

    public class Resourcebaseforparentresources
    {
        public Allof3[] allOf { get; set; }
    }

    public class Allof3
    {
        public string _ref { get; set; }
        public Properties4 properties { get; set; }
        public string[] required { get; set; }
    }

    public class Properties4
    {
        public Kind kind { get; set; }
        public Location1 location { get; set; }
        public Tags tags { get; set; }
        public Sku sku { get; set; }
        public Plan plan { get; set; }
        public Copy copy { get; set; }
        public Comments comments { get; set; }
    }

    public class Kind
    {
        public string type { get; set; }
        public int maxLength { get; set; }
        public string pattern { get; set; }
        public string description { get; set; }
    }

    public class Location1
    {
        public string _ref { get; set; }
        public string description { get; set; }
    }

    public class Tags
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Sku
    {
        public string _ref { get; set; }
    }

    public class Plan
    {
        public string _ref { get; set; }
    }

    public class Copy
    {
        public string _ref { get; set; }
    }

    public class Comments
    {
        public string type { get; set; }
    }

    public class Resourcebaseexternal
    {
        public string _ref { get; set; }
        public string[] required { get; set; }
    }

    public class Childresources
    {
        public string type { get; set; }
        public Items2 items { get; set; }
    }

    public class Items2
    {
        public string _ref { get; set; }
    }

    public class Armchildresources
    {
        public Oneof2[] oneOf { get; set; }
    }

    public class Oneof2
    {
        public string _ref { get; set; }
    }

    public class Resourcesku
    {
        public string type { get; set; }
        public Properties5 properties { get; set; }
        public string[] required { get; set; }
    }

    public class Properties5
    {
        public Name1 name { get; set; }
        public Tier tier { get; set; }
        public Size size { get; set; }
        public Family family { get; set; }
        public Capacity capacity { get; set; }
    }

    public class Name1
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Tier
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Size
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Family
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Capacity
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Resourcecopy
    {
        public string type { get; set; }
        public Properties6 properties { get; set; }
    }

    public class Properties6
    {
        public Name2 name { get; set; }
        public Count count { get; set; }
    }

    public class Name2
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Count
    {
        public Oneof3[] oneOf { get; set; }
        public string description { get; set; }
    }

    public class Oneof3
    {
        public string _ref { get; set; }
        public string type { get; set; }
    }

    public class Resourceplan
    {
        public string type { get; set; }
        public Properties7 properties { get; set; }
        public string[] required { get; set; }
        public string description { get; set; }
    }

    public class Properties7
    {
        public Name3 name { get; set; }
        public Promotioncode promotionCode { get; set; }
        public Publisher publisher { get; set; }
        public Product product { get; set; }
    }

    public class Name3
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Promotioncode
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Publisher
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Product
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Resourcelocations
    {
        public Anyof[] anyOf { get; set; }
    }

    public class Anyof
    {
        public string type { get; set; }
        public string[] _enum { get; set; }
    }

    public class Parameter
    {
        public string type { get; set; }
        public Properties8 properties { get; set; }
        public string[] required { get; set; }
        public string description { get; set; }
    }

    public class Properties8
    {
        public Type1 type { get; set; }
        public Defaultvalue defaultValue { get; set; }
        public Allowedvalues allowedValues { get; set; }
        public Metadata metadata { get; set; }
    }

    public class Type1
    {
        public string _ref { get; set; }
        public string description { get; set; }
    }

    public class Defaultvalue
    {
        public string _ref { get; set; }
        public string description { get; set; }
    }

    public class Allowedvalues
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Metadata
    {
        public string type { get; set; }
        public string description { get; set; }
    }

    public class Output
    {
        public string type { get; set; }
        public Properties9 properties { get; set; }
        public string[] required { get; set; }
        public string description { get; set; }
    }

    public class Properties9
    {
        public Type2 type { get; set; }
        public Value value { get; set; }
    }

    public class Type2
    {
        public string _ref { get; set; }
        public string description { get; set; }
    }

    public class Value
    {
        public string _ref { get; set; }
        public string description { get; set; }
    }

    public class Parametertypes
    {
        public string[] _enum { get; set; }
    }

    public class Parametervaluetypes
    {
        public string[] type { get; set; }
    }

    public class Expression
    {
        public string type { get; set; }
        public string pattern { get; set; }
        public string description { get; set; }
    }

    public class Iso8601duration
    {
        public string type { get; set; }
        public string pattern { get; set; }
    }

    public class UTC
    {
        public string type { get; set; }
        public string pattern { get; set; }
    }

    public class Apiversion1
    {
        public string type { get; set; }
        public string pattern { get; set; }
        public string description { get; set; }
    }

    class Program
    {
        static void Main(string[] args)
        {

            {
                if (args == null)
                {
                    Console.WriteLine("args is null"); // Check for null array
                }
                else
                {
                    Console.Write("args length is ");
                    Console.WriteLine(args.Length); // Write array length
                    for (int i = 0; i < args.Length; i++) // Loop through array
                    {
                        string argument = args[i];
                        Console.Write("args index ");
                        Console.Write(i); // Write index
                        Console.Write(" is [");
                        Console.Write(argument); // Write string
                        Console.WriteLine("]");
                    }
                }
                Console.ReadLine();
            }
        }
    }
}
