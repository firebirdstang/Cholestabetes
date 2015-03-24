using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cholestabetes.Domain;

namespace Cholestabetes.Repositories
{
    public class ProvinceRepository : BaseRepository
    {

        public List<Cholestabetes.Domain.Province> GetProvinces()
        {
            return Entites.Provinces.Select(p => new Province() 
            { ID =p.ID , Name = p.name })
            .ToList();

        }
    
    }
}
