<div class="col-w">
	<div class="cbox cbox1">
		<div class="ctitle">
			<h3>最新活动</h3>
		</div>
		<div class="content">
			<ul class="cpro-list">
				<@s.iterator value="(map.get('recommendInfoMainList')).get('${channelPage}_PAGE_RIGHT_ACTIVITY')" status="st">
				<li>
                    <a title="${title?if_exists}" target="_blank" class="text-cover auto_img" href="${url?if_exists}">
                        <img src="${imgUrl?if_exists}" width="180" height="120" alt="${title?if_exists}" />
                        <span></span>
						<i><b>${title?if_exists}</b><em> | </em>${bakWord1?if_exists}</i>
                    </a>
					<p><@s.if test="bakWord2!=null">${bakWord2}</@s.if><@s.else>不定期</@s.else></p>
                </li>
				</@s.iterator>
			</ul>
		</div>
	</div>

    
	<div class="cbox cbox2">
		<div class="ctitle">
			<h3>产品特推</h3>
		</div>
		<div class="content">
			<ul class="cpro-buy">
				<@s.iterator value="(map.get('recommendInfoMainList')).get('${channelPage}_PRODUCT_RECOMMEND')" status="st">
					<li><a rel="nofollow" target="_blank" class="text-cover" href="${url?if_exists}"> 
					<img src="${imgUrl?if_exists}" width="180" height="120" alt="${title?if_exists}" /> 
	 				</a>
						<div class="textbox">
							<p class="text">
								<a target="_blank" href="${url?if_exists}"> ${title?if_exists}</a>
							</p>
							<p>
								<a rel="nofollow" class="btnbuy" target="_blank" href="${url?if_exists}">抢购</a>
								<dfn>
									&yen;<i>${memberPrice?if_exists}</i>
								</dfn>	<span class="price">节省：&yen;${marketPrice?default("0")?number-memberPrice?default("0")?number}</span> 
								
	 					</div></li> 
 				</@s.iterator>
			</ul>
		</div>
	</div>

	 <div class="cbox cbox3">
            <div class="ctitle">
                <h3>推荐目的地</h3>
                <ul class="tabnav JS_tabnav">
                  <@s.iterator value="(map.get('recommendInfoMainList')).get('${channelPage}_PAGE_RIGHT_SPOT')" status="st">
                	<li <@s.if test="#st.index==0">class="selected"</@s.if>>
                	<a paramId="tab${st.count}" 
                	paramDataCode="${bakWord1?if_exists}" paramDataSearchName="${title?if_exists}">${title?if_exists}<i class="css_arrow"></i></a></li>
                 	</@s.iterator>
                </ul>
            </div>
            <div class="content JS_tabsbox JS_sildename">
             <@s.iterator value="(map.get('recommendInfoMainList')).get('${channelPage}_PAGE_RIGHT_SPOT')" status="st">

               <@s.if test="#st.count==1"> 
               <div class="tabcon selected" id="tab${st.count}">
	                <ul class="cprobig-list ">
	                  <@s.iterator value="(map.get('recommendInfoMainList')).get('${channelPage}_${bakWord1?if_exists}')" status="st">
	                    <li>
	                        <a target="_blank" class="text-cover auto_img" href="${url?if_exists}" title="${title?if_exists}">
	                            <img to="${imgUrl?if_exists}" width="252" height="168" alt="${title?if_exists}" />
	                            <span></span>
	                            <i>${title?if_exists}</i>
	                            <dfn>¥<i>${memberPrice?if_exists}</i>起</dfn>
	                        </a>
 	                        <p><b>推荐理由：</b><@s.if test="remark!=null && remark.length()>55">
								<@s.property value="remark.substring(0,55)" escape="false"/>...
								</@s.if><@s.else>${remark?if_exists}
								</@s.else></p>
	                    </li>
	                    </@s.iterator>
	                </ul>
		            <p class="link-more"><a target="_blank" href="http://www.lvmama.com/search/route/${fromPlaceName?if_exists}-${title?if_exists}.html">— — 查看${title?if_exists}更多 — —</a></p>
		            </div>
	            </@s.if>
	            <@s.else>
	                <div class="tabcon" id="tab${st.count}">
	                </div>
	            </@s.else>
               </@s.iterator> 
            </div>
        </div>
        
	<div class="pro-textlist">
		<div class="cbox cbox4">
			<div class="ctitle">
				<h3>推荐自由行</h3>
				 
			</div>
			<div class="content">
				<ul class="textlist">
					<@s.iterator
					value="(map.get('recommendInfoMainList')).get('${channelPage}_PAGE_RIGHT_RECOMMEND_FREETOUR')"
					status="st">
					<li><dfn> &yen;<i>${memberPrice?if_exists}</i>起
						</dfn><a target="_blank" href="${url?if_exists}"><@s.if
							test="title!=null && title.length()>25"><@s.property
							value="title.substring(0,25)"
							escape="false"/></@s.if><@s.else>${title?if_exists}</@s.else></a></li>
					</@s.iterator>
				</ul>
			</div>
		</div>

		<div class="cbox cbox4">
			<div class="ctitle">
				<h3>推荐跟团游</h3>
			 
			</div>
			<div class="content">
				<ul class="textlist">
					<@s.iterator
					value="(map.get('recommendInfoMainList')).get('${channelPage}_PAGE_RIGHT_RECOMMEND_GROUP')"
					status="st">
					<li><dfn>&yen;<i>${memberPrice?if_exists}</i>起</dfn>
					<a target="_blank" href="${url?if_exists}"><@s.if
							test="title!=null && title.length()>25"><@s.property
							value="title.substring(0,25)"
							escape="false"/></@s.if><@s.else>${title?if_exists}</@s.else>
					</a></li>
					</@s.iterator>
				</ul>
			</div>
		</div>
	</div>

</div> <!-- //.col-w -->