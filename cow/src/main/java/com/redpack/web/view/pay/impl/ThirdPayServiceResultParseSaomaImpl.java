package com.redpack.web.view.pay.impl;

import org.springframework.stereotype.Service;

import com.redpack.web.view.pay.service.IThirdPayServiceResultParser;
import com.redpack.web.view.pay.service.PayResult;
import com.redpack.web.view.pay.service.ParseResult;

@Service("saomaPayServiceResultParse")
public class ThirdPayServiceResultParseSaomaImpl implements IThirdPayServiceResultParser  {

	@Override
	public ParseResult parse(PayResult result) {
		ParseResult parseResult = new ParseResult(result);
		return parseResult;
	}

}
