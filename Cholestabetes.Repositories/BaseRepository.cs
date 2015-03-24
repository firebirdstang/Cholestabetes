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

        private CholestabetesEntities ent = null;

        public CholestabetesEntities Entites
        {

            get
            {
                if (ent == null)
                    ent = new CholestabetesEntities();

                return ent;
            }
        }
 
    }
}
