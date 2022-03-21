/**
 * jquery 레이어 에디터
 * 
 * 1. 이 레이어를 사용할 화면에서 this를 사용하고 싶을 경우 $thisLayer 를 이용하라.(비 권장: 차후 deprecated 될 수 있음)
 * 2. load 한 레이어에서 customButtons 정의 시 참고사항: 로드 할 자식 Layer 에서 빈 객체만 생성하여 define 한 후 Layer html 로드
 * 타이밍에 해당 객체에 버튼정보를 세팅하도록한다.
 * 
 * @author shLee 
 * @version 1.0
 */
;(function($) {
"use strict";
$.leditor = $.leditor || {};
$.extend($.leditor,{
	getAccessor: function(obj, expr) {
		var ret,p,prm = [], i;
		if( typeof expr === 'function') { return expr(obj); }
		ret = obj[expr];
		if(ret===undefined) {
			try {
				if ( typeof expr === 'string' ) {
					prm = expr.split('.');
				}
				i = prm.length;
				if( i ) {
					ret = obj;
					while (ret && i--) {
						p = prm.shift();
						ret = ret[p];
					}
				}
			} catch (e) {}
		}
		return ret;
	},
	extend : function(methods) {
		$.extend($.fn.layereditor,methods);
	}
});
$.fn.layereditor = function(options) {
	/*if($.isArray(options) && (options.length == 2 || options.length == 3)) {
		if(options[0] === "result") {
			setResult(options[1]);
			if(options[2] && options[2] == true) {
				process.apply(this,arguments);
			}
			return false;
		};
	}*/
	if (typeof options == 'string') {
		var fn = $.leditor.getAccessor($.fn.layereditor, options);
		if(!fn) {
			throw ("layereditor - No such method: " + options);
		}
		var args = $.makeArray(arguments).slice(1);
		return fn.apply(this, args);
	};
	
	return this.each(function() {
		//if(this.le) {return;}
		var o = $.extend(true,{
			autoOpen: false,
			height: 300,
			width: 350,
			//opacity: 20,
			modal: true,
			resizable: true,
			destroyWhenClose: true,
			//msgObject: null,
			fields: [],
			process: function() {
				viewAlert("처리 되었습니다.");
			},
			closeProcess: function() {},
			closeOnEscape: false,
			customButtons: [],
			buttons: null,
			dStart: function() {},
			dStop: function() {},
			close: function() {
				allFields.val("").removeClass("ui-state-error");
			},
			result: null,
			openComplete: null	// Document Ready 타이밍 보다 더 후에 발생하는 이벤트이다.(최종적인 Dom렌더링이 완료 된 이후의 시점)
		}, $.leditor.defaults, options || {});
		
		var ts = this, $thisLayer = this;
		// 전체 필드 세팅
		var allFields = $([]);
		for(var i=0; i<o.fields.length; i++) {
			var fName = $("#"+o.fields[i].name);
			allFields = allFields.add(fName);
		}
		
		// 유효성 검사 메세지 출력 영역 및 커스텀 버튼 생성 start
		var buttonArea = $("<div class='top_btn_area_layer'><ul><li></li></ul></div>"),
		buttonArray = o.customButtons,
		
		buttonLen = StringUtil.getLength(o.customButtons);
		
		if(buttonLen > 0) {
			$(this).prepend($(buttonArea));
			for(var i = 0; i < buttonLen; i++) {
				var bName = buttonArray[i].name;
				var aTag = $('<a />').text($.trim(bName));
				
				var btn = $("<span class='button medium'></span>").append(aTag);
				$(".top_btn_area_layer li",this).append($(btn));
			}
			
			$("div.top_btn_area_layer span",this).each(function (i) {
				$(this).children('a').bind('click', function (e) {
					e.preventDefault();
				
					allFields.removeClass("ui-state-error");
					
					var isProceed = true;
					if(buttonArray[i].useValidate) {
						isProceed = validateForm();
					}
					if(isProceed && buttonArray) {
						if(buttonArray[i].action) {
							buttonArray[i].action.apply();
						}
						if(buttonArray[i].autoClose) {
							$(ts).dialog("close");
						}
					}
				});
			});
		}
		
		//var messageBox = $('<div class="ui-widget"><div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;"><p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Hey!</strong> Sample ui-state-highlight style.</p></div></div>');
		var messageBox = $('<p class="validateMessages"></p>');
		$(this).prepend(messageBox);
		//$(this).prepend($("<p class='validateMessages'></p>"));
		// 유효성 검사 메세지 출력 영역 및 커스텀 버튼 생성 end
		
		var layer = {
			// layer setting & initialize
			initLayer: function() {
				$(ts).dialog({
					autoOpen: o.autoOpen,
					open:o.open,
					height: o.height,
					width: o.width,
					//opacity: o.opacity,
					modal: o.modal,
					resizable: o.resizable,
					closeOnEscape: o.closeOnEscape,
					buttons: o.buttons,
					dragStart: o.dStart,
					dragStop: o.dStop,
					beforeClose: function() {
						if(o.closeProcess) {
							o.closeProcess();
						}
					},
					close: function() {
						if(o.destroyWhenClose) {
							$(ts).dialog("destroy");
							$(ts).empty();
						}
					}
				});
			}
		};

		// 레이어 초기화
		layer.initLayer();
		this.o = o;
		this.$thisLayer = $thisLayer;
	});
};

$.leditor.extend({
	/** validate check */
	validateForm : function() {
		var isValid = true;
		
		allFields.each(function(i, obj) {
			var vType = o.fields[i].validType;
			var vRegexpType = o.fields[i].validRegexpType;
			
			if($.isArray(vType)) {
				for(var idx=0; idx < vType.length; idx++) {
					//유효성 검사 실행
					if(!runValidate(allFields.get(i), vType[idx])) {
						isValid = false;
						break;
					}
				}
			} else if(vType != undefined) {
				//유효성 검사 실행
				if(!runValidate(allFields.get(i), vType)) {
					isValid = false;
				}
			}
			
			if(!isValid) {
				return false;
			}
			
			if($.isArray(vRegexpType)) {
				for(var idx=0; idx < vRegexpType.length; idx++) {
					if(!runValidateRegexp(allFields.get(i), vRegexpType)) {
						isValid = false;
						break;
					}
				}
			} else if(vRegexpType != undefined) {
				if(!runValidateRegexp(allFields.get(i), vRegexpType)) {
					isValid = false;
				}
				
				if(o.fields[i].validRegexpType === "normal") {
					/*isValid = isValid && checkLength($(allFields.get(i)), "askjdhfkjsahdkfhkjsadhf", 3, 16);
					isValid = isValid && checkRegexp(name, /^[a-z]([0-9a-z_])+$/i, "문자로 시작하는 문자, 숫자 , _(기호) 만  입력 할 수 있습니다.");
					isValid = isValid && checkRegexp(email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "예) devmin@devmj.com");
					isValid = isValid && checkRegexp(password, /^([0-9a-zA-Z])+$/, "비밀번호는 문자, 숫자만 입력 할 수 있습니다.");*/
				} else {
					
				}
				
			}
			
			if(!isValid) {
				return false;
			}
		});
		return isValid;
	},
	
	/**
	 * 유효성 규칙 유틸리티
	 */
	validationRole : {
		//값이 없음
		isBlank : function(str) { var patBlank = /^\s*$/i; return patBlank.test(str); },
		//값이 있음
		isNotBlank : function(str) { var patBlank = /^\s*$/i; return !patBlank.test(str); },
		//길이 체크 (최소:min , 최대: max)
		checkLength : function(str, min, max) { return str.length <= max && str.length >= min; },
		/**
		 * 각 항목에 대한 바이트 체크를 한다. 
		 * 최소:min , 최대: max
		 * (한글:3byte,ENTER:2byte,그외 1바이트)
		 * 오라클 DB NLS LANG이 UTF-8인 경우에만 해당
		 * 오라클 DB NLS LANG이 MS949WIN이라면 한글 2byte(0x00FFFF)의 strSize 2로 변경
		 */
		checkByteLength : function(str, min, max) { 
			if (str == null || str.length == 0) { return false; }
			var strSize = 0;
			for(var i=0; i<str.length; i++){
				var charCode = str.charCodeAt(i);
				if (charCode <= 0x00007F) {
					strSize += 1;
				}else if (charCode <= 0x0007FF) {
					strSize += 2;
				}else if (charCode <= 0x00FFFF) {
//						strSize += 3;
					strSize += 2;
				}else {
					strSize += 4;
				}
			}
			if(strSize <= max && strSize >= min) {
				return true;
			} else {
				return false;
			}
		}
	},
	
	/**
	 * 일반 유효성 체크
	 * type : 
	 * 			1. required : 필수항목 체크
	 * 			2. length : 문자의 수로 길이 체크
	 * 			3. byteLength : 문자의 길이를 바이트로 연산하여 체크
	 */
	runValidate : function(obj, validType) {
		var isValid = true;
		var validLabelText = $("label[for='"+$(obj).attr("id")+"']",$(this)).text();
		
		if(typeof(validType) == 'object') {
			switch(validType.type) {
			case "required" : isValid = checkRequired($(obj), validLabelText); break;
			case "length" :
				if(validType.min == undefined) validType.min = 0;
				isValid = checkLength($(obj), validLabelText, validType.min, validType.max); break;
			case "byteLength" : 
				if(validType.min == undefined) validType.min = 0;
				isValid = checkByteLength($(obj), validLabelText, validType.min, validType.max); break;
			default : break;
			}
		} else {
			switch(validType) {
			case "required" : isValid = checkRequired($(obj), validLabelText); break;
			case "length" :
			case "byteLength" : isValid = false; alert("type이 "+ validType +"인 경우\n min or max값이 필요함."); break;
			default : break;
			}
		}
		return isValid;
	},
	
	//유효성 검사 실행
	runValidateRegexp : function(obj, regExpType) {
		var isValid = true;
		var validLabelText = $("label[for='"+$(obj).attr("id")+"']",$(this)).text();
		
		if($.isFunction(regExpType)) {
			isValid = regExpType.apply();
		} else {
			var exp = new RegExp(regExpType.exp);
			if(!exp.test($(obj).val())) {
				isValid = false;
				$(obj).addClass("ui-state-error");
				updateMessages(validLabelText + " 필드는 " + regExpType.msg);
			}
		}
		
		return isValid;
	},
	
	// 메시지 업데이트
	updateMessages : function(t){
		var validMsg = $("p.validateMessages",this);
		if(validMsg) {
			$(validMsg).text(t).addClass( "ui-state-highlight" );
			setTimeout(function() {
				$(validMsg).removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}
	},
	// 길이 체크
	checkLength : function(f, n, min, max) {
		if (!validationRole.checkLength($(f).val(), min, max)) {
			f.addClass("ui-state-error");
			updateMessages(n + " 의 길이는 " + " 최소: " + min + ", 최대: " + max + " 입니다." );
			return false;
		} else {
			return true;
		}
	},
	// 바이트 길이 체크
	checkByteLength : function(f, n, min, max) {
		if (!validationRole.checkByteLength($(f).val(), min, max)) {
			f.addClass("ui-state-error");
			updateMessages(n + " 의 길이는 " + " 최소: " + min + ", 최대: " + max + " 입니다." );
			return false;
		} else {
			return true;
		}
	},
	// 필수 체크
	checkRequired : function(f, n) {
		if (validationRole.isBlank($(f).val())) {
			f.addClass("ui-state-error");
			updateMessages(n + " 은(는) 필수항목입니다." );
			return false;
		} else {
			return true;
		}
	},
	// 패턴 체크
	checkRegexp : function(f, regexp, n) {
		if (!(regexp.test($(f).val()))) {
			f.addClass("ui-state-error");
			updateMessages(n);
			return false;
		} else {
			return true;
		}
	},
	// layer open
	open : function() {
		var ts=this;
		return this.each(function() {
			var $t=this;
			$(ts).dialog("open");
			if($t.o.openComplete) {
				$t.o.openComplete();
			}
		});
	},
	// layer close
	close : function(ignoreCloseProcess) {
		var ts=this;
		return this.each(function() {
			if(ignoreCloseProcess) {
				$(ts).dialog({
					beforeClose: null
				});
			}
			$(ts).dialog("close");
		});
	},
	// dStart
	dStart : function() {
		var ts=this;
		return this.each(function() {
			var $t = this;
			console.log($t);
			if($t.o.dStart) {
				$(ts).dialog("option", "dragStart", $t.o.dStart());
			}
		});
	},
	// dStop
	dStop : function() {
		return this.each(function() {
			var $t = this;
			if($t.o.dStop) {
				$(ts).dialog("option", "dragStop", $t.o.dStop());
			}
		});
	},
	// process
	process : function() {
		return this.each(function() {
			var $t = this;
			$t.o.process();
		});
	},
	// getResult
	getResult : function() {
		return this.each(function() {
			var $t = this;
			return $t.o.result;
		});
	},
	/** 
	 * setResult 
	 * @param res Caller에게 전달하기 위한 결과 데이터
	 * @param autoProcess Caller에서 정의한 process 자동호출 여부
	 * @returns jQuery
	 */
	result : function(res, autoProcess) {
		var ts = this;
		return this.each(function() {
			var $t = this;
			$t.o.result = res;
			if(autoProcess) {
				$t.o.process.call(ts,res);
			}
			//$(ts).dialog("close");
		});
	}
});

})(jQuery);