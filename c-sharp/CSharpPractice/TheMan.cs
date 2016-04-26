using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpPractice
{
    public class TheMan
    {
        private List<string> manStore = new List<string>();
        
        public void buildMan()
        {
            manStore.Add("          O");
            manStore.Add("          |");
            manStore.Add("        --|--/");
            manStore.Add("       /  |");
            manStore.Add("          ^");
            manStore.Add("         / \\");
            manStore.Add("        /   \\");
            manStore.Add("      --     --");

        }

        public List<string> outPutMan()
        {
            return manStore;
        }


    }
}
