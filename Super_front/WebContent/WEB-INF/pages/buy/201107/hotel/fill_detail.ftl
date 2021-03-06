			    <h3><s></s>产品信息</h3>
			    <table class="orderpro-list">
					<thead>
					    <tr>
						 <@s.if test='mainProdBranch.prodProduct.IsAperiodic()'>
							<th class="col0">产品有效期</th>
						</@s.if>
						<@s.else>
							<th class="col1">入住日期</th>
							<th class="col1">离开日期</th>
						</@s.else>
						<th class="col1">入住晚数</th>
						<th class="col6">入住房型</th>
						<th class="col3">市场价</th>
						<th class="col4">现售价</th>
						<th class="col6">数量(间)</th>
						<th class="col7">小计</th>
					    </tr>
					</thead>
					<tbody>
						<tr>
							<@s.if test='mainProdBranch.prodProduct.IsAperiodic()'>
								<td class="col1 date">
									${mainProdBranch.validBeginTime?string('yyyy-MM-dd')}至${mainProdBranch.validEndTime?string('yyyy-MM-dd')}
									<@s.if test='mainProdBranch.invalidDateMemo != null && mainProdBranch.invalidDateMemo != ""'>
										(${mainProdBranch.invalidDateMemo})
									</@s.if>
								</td>
							</@s.if>
							<@s.else>
								<td class="col1 date" value="${mainProdBranch.productId?if_exists}" visitTime="${buyInfo.visitTime?if_exists}" id="id">
									${buyInfo.visitTime?if_exists}
								</td>
								<td class="col1 date">
									${buyInfo.leaveTime?if_exists}
								</td>
							</@s.else>
							<td class="col1">${buyInfo.days}晚</td>
							<td class="col6">
								<a href="http://www.lvmama.com/product/${mainProdBranch.productId?if_exists}">${mainProdBranch.branchName}</a>
							</td>
							<td class="col3"><del>&yen;${mainProdBranch.marketPriceYuan?if_exists}</del></td>
							<td class="col4"><strong>&yen;${mainProdBranch.sellPriceYuan?if_exists}</strong></td>
							<td class="col6 btn-nums">
							    <input type="hidden" productId="${mainProdBranch.prodBranchId}" id="param${mainProdBranch.prodBranchId}"  ordNum="ordNum"  name="paramName" minAmt="${mainProdBranch.minimum}" maxAmt="<#if (mainProdBranch.maxinum>0) >${mainProdBranch.maxinum}<#else>${mainProdBranch.stock}</#if>" textNum="textNum${mainProdBranch.prodBranchId}" people="${mainProdBranch.adultQuantity+mainProdBranch.childQuantity}" buyPeopleNum="<@s.property value='buyInfo.buyNum.product_${mainProdBranch.prodBranchId}*${mainProdBranch.adultQuantity+mainProdBranch.childQuantity}'/>" value="<@s.property value='buyInfo.buyNum.product_${mainProdBranch.prodBranchId}'/>" sellPriceYuan="${mainProdBranch.sellPriceYuan}"/>
							    <button class="btn-minus" type="button" onClick="updateOperator('param${mainProdBranch.prodBranchId}','miuns');refreshTotal('param${mainProdBranch.prodBranchId}','textNum${mainProdBranch.prodBranchId}',1,'total${mainProdBranch.prodBranchId}')">-</button>
							    <input type="text" id="textNum${mainProdBranch.prodBranchId}" name="buyInfo.buyNum.product_${mainProdBranch.prodBranchId}" value="<@s.property value='buyInfo.buyNum.product_${mainProdBranch.prodBranchId}'/>" onblur="updateOperator('param${mainProdBranch.prodBranchId}','input');refreshTotal('param${mainProdBranch.prodBranchId}','textNum${mainProdBranch.prodBranchId}',1,'total${mainProdBranch.prodBranchId}')" couponPrice="0"  type="text" cashRefund="${mainProdBranch.cashRefundFloat?if_exists}" sellName="sellName" marketPrice="${mainProdBranch.marketPriceYuan?if_exists}"  sellPrice="${mainProdBranch.sellPriceYuan}" class="inp-text" size="2" autocomplete="off">
							    <button class="btn-add" type="button" onClick="updateOperator('param${mainProdBranch.prodBranchId}','add');refreshTotal('param${mainProdBranch.prodBranchId}','textNum${mainProdBranch.prodBranchId}',1,'total${mainProdBranch.prodBranchId}')">+</button>
							</td>
							<td class="col7"><span>&yen;</span><strong class="total" id="total${mainProdBranch.prodBranchId}"><script>document.write(${mainProdBranch.sellPriceYuan} * <@s.property value='buyInfo.buyNum.product_${mainProdBranch.prodBranchId}'/>)</script></strong></td>
						</tr>
	
						<@s.iterator value="relatedProductList" var="product">
								<tr>
									<@s.if test='mainProdBranch.prodProduct.IsAperiodic()'>
										<td class="col1 date">
											${product.validBeginTime?string('yyyy-MM-dd')}至${product.validEndTime?string('yyyy-MM-dd')}
											<@s.if test='#product.invalidDateMemo != null && #product.invalidDateMemo != ""'>
												(${product.invalidDateMemo})
											</@s.if>
										</td>
									</@s.if>
									<@s.else>
										<td class="col1 date">${buyInfo.visitTime?if_exists}</td>
										<td class="col1 date">${buyInfo.leaveTime?if_exists}</td>
									</@s.else>
									<td class="col3">${buyInfo.days}晚</td>
									<td class="col4"><@s.property value="branchName" /></td>
									<td class="col5"><del>&yen;${product.marketPriceYuan?if_exists}</del></td>
									<td class="col6"><strong>&yen;${product.sellPriceYuan?if_exists}</strong></td>
									<td class="col7 btn-nums">
										<input type="hidden" productId="${product.prodBranchId}" id="param${product.prodBranchId}"  ordNum="ordNum"  name="paramName" minAmt="${product.minimum}" maxAmt="<#if (product.maximum>0) >${product.maximum}<#else>${product.stock}</#if>" textNum="textNum${product.prodBranchId}" people="${product.adultQuantity+product.childQuantity}" buyPeopleNum="<@s.property value='buyInfo.buyNum.product_${product.prodBranchId}*${product.adultQuantity+product.childQuantity}'/>" value="<@s.property value='buyInfo.buyNum.product_${product.prodBranchId}'/>" sellPriceYuan="${product.sellPriceYuan}"/>
									    <button class="btn-minus" type="button" onClick="updateOperator('param${product.prodBranchId}','miuns');refreshTotal('param${product.prodBranchId}','textNum${product.prodBranchId}','total${product.prodBranchId}')">-</button>
									    <input type="text" class="inp-text" size="2" name="buyInfo.buyNum.product_${product.prodBranchId}" maxlength="3" couponPrice="0" onblur="updateOperator('param${product.prodBranchId}','input');;refreshTotal('param${product.prodBranchId}','textNum${product.prodBranchId}','total${product.prodBranchId}')" sellName="sellName" cashRefund="${product.cashRefundFloat?if_exists}"  marketPrice="${product.marketPriceYuan}" sellPrice="${product.sellPriceYuan}" <@s.if test="buyInfo.buyNum.product_${product.prodBranchId}==null" >value="0"</@s.if><@s.else>value="<@s.property value='buyInfo.buyNum.product_${product.prodBranchId}'/>"</@s.else> id="textNum${product.prodBranchId}"  autocomplete="off"/>
									    <button class="btn-add" type="button" onClick="updateOperator('param${product.prodBranchId}','add');refreshTotal('param${product.prodBranchId}','textNum${product.prodBranchId}','total${product.prodBranchId}')">+</button>
									</td>
									<td class="col8"><span>&yen;</span><strong class="total" id="total${product.prodBranchId}"><script>document.write(${product.sellPriceYuan} * <@s.if test="buyInfo.buyNum.product_${product.prodBranchId}==null" >0</@s.if><@s.else><@s.property value="buyInfo.buyNum.product_${product.prodBranchId}"/></@s.else>)</script></strong></td>
								</tr>
						</@s.iterator>
					</tbody>
			    </table>
