﻿using DBConnection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Daos.Interfaces
{
    public interface IVentaDao : IRepositoryBase
    {
        DataSet Insert(DataSet dsCarrito);
    }
}
