using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Data;

 

namespace Cholestabetes.Repositories
{
    public class BaseRepository
    {

        public BaseRepository()
        {
             
            
        }

        private CholestabetesEntities1 ent = null;

        public CholestabetesEntities1 Entites
        {

            get
            {
                if (ent == null)
                    ent = new CholestabetesEntities1();

                return ent;
            }
        }
 
    }
}
