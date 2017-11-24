using UnityEngine;
using System;
using System.Collections.Generic;

public class ErrorData
{
	public static ErrorData instance;

	static ErrorData()
	{
		instance = new ErrorData();
	}

	public string getError(ushort key)
	{
		return errorData[key];
	}

	ErrorData()
	{
		initMember();
	}

	public static Dictionary<ushort, string> errorData = new Dictionary<ushort, string>();

	private void initMember()
	{
		errorData.Add(510, "停服踢人");


		errorData.Add(1510, "场景为空");






	}
}
