package kosa.hdit5.evenapp.util;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import oracle.sql.*;

import kosa.hdit5.evenapp.vo.CartVO;

@MappedTypes(java.util.ArrayList.class)
@MappedJdbcTypes(JdbcType.ARRAY)
public class CartVOListTypeHandler implements TypeHandler {

	@Override
	public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException
    {
        List<CartVO> objects = (List<CartVO>) parameter;

        StructDescriptor structDescriptor = StructDescriptor.createDescriptor("CARTVO", ps.getConnection());

        STRUCT[] structs = new STRUCT[objects.size()];
        for (int index = 0; index < objects.size(); index++)
        {
        	CartVO pack = objects.get(index);
            Object[] params = new Object[4];
            params[0] = pack.getUserId();
            params[1] = pack.getProductId();
            params[2] = pack.getProductCnt();
            params[3] = pack.getProductName();
            STRUCT struct = new STRUCT(structDescriptor, ps.getConnection(), params);
            structs[index] = struct;
        }

        ArrayDescriptor desc = ArrayDescriptor.createDescriptor("ARRAY_TABLE", ps.getConnection());
        ARRAY oracleArray = new ARRAY(desc, ps.getConnection(), structs);
        ps.setArray(i, oracleArray);
    }

	@Override
	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}