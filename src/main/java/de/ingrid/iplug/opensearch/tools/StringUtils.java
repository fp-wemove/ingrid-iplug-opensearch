package de.ingrid.iplug.opensearch.tools;

public class StringUtils {
	/**
	 * Checks if a text string contains a parameter, which also might be optional. 
	 * @param text, the string to search for a parameter
	 * @param parameter, the parameter to look for
	 * @return true, if parameter was found (with or without '?', which marks a parameter optional) 
	 */
	public static boolean parameterExists(String text, String parameter) {
		if (text.indexOf("{"+parameter+"}") != -1 || text.indexOf("{"+parameter+"?}") != -1 ) {
			return true;
		}
		return false;
	}
	
	public static String replaceParameter(String text, String parameter, String insert) {
		if (insert == null) {
			return text;
		}
		
		String pattern = "\\{"+parameter+"\\??\\}";
		String res = text.replaceAll(pattern, insert);
		return res;
		
	}

	public static String removeUnusedParameter(String query) {
		// this pattern represents:
		// [in front or middle      ] [at the end of the query]
		// xxx={yyy}& | xxx={yyy?}& | &xxx={yyy}& | &xxx={yyy?}
		// where in "yyy" no "&" must occur!
		String pattern = "(\\w*=\\{[^&]*\\??\\}&?|&\\w*=\\{[^&]*\\??\\})";
		String res = query.replaceAll(pattern, "");
		return res;
	}
}