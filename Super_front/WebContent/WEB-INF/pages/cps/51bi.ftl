<#list orderChannelInfoList as orderChannelInfo>${orderChannelInfo.createDate?string("yyyy-MM-dd HH:mm:SS")}|${orderChannelInfo.orderId}|${orderChannelInfo.arg1}|${orderChannelInfo.ordOrder.oughtPayYuan}||_|</#list>  