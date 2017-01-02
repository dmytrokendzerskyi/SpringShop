package ua.com.shop.editor;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;

import ua.com.shop.service.MakerService;

public class MakersEditor extends PropertyEditorSupport {

	@Autowired
	private MakerService makerService;
	
	
	
public MakersEditor(MakerService makerService) {
		super();
		this.makerService = makerService;
	}



//	private final MakerService makerService;

//	public MakersEditor(MakerService makerService) {
//		super();
//		this.makerService = makerService;
//	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		setValue(makerService.findOne(Integer.parseInt(text)));
	}
	
	
	
}
