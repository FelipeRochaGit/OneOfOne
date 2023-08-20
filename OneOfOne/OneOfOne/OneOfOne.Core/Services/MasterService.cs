using OneOfOne.Core.Daos.Interfaces;
using OneOfOne.Core.Daos;
using OneOfOne.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Services
{
    public class MasterService : IMasterService
    {
        private IMasterDao _MasterDao;

        public MasterService()
        {
            _MasterDao = new MasterDao();
        }

        public bool registrarMail(string Mail)
        {
            return _MasterDao.registrarMail(Mail);
        }
    }
}
