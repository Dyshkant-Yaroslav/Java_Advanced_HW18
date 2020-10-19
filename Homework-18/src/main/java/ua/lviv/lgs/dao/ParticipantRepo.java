package ua.lviv.lgs.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import ua.lviv.lgs.domain.Participant;

@Repository
public class ParticipantRepo {

	private List<Participant> participants = new ArrayList<>();

	@PostConstruct
	public void init() {
		Participant p1 = new Participant();
		p1.setName("Ivan");
		p1.setEmail("ivan@gmail.com");
		p1.setId(1);
		p1.setLevel("L1");
		p1.setPrimarySkill("running");

		Participant p2 = new Participant();
		p2.setName("Stepan");
		p2.setEmail("stepan@gmail.com");
		p2.setId(2);
		p2.setLevel("L2");
		p2.setPrimarySkill("swimming");

		Participant p3 = new Participant();
		p3.setName("Petro");
		p3.setEmail("petro@gmail.com");
		p3.setId(3);
		p3.setLevel("L3");
		p3.setPrimarySkill("flying");

		participants.add(p1);
		participants.add(p2);
		participants.add(p3);
	}

	public List<Participant> findAllParticipants() {
		return participants;
	}

	public Participant findOne(int id) {
		return participants.stream().filter(prtc -> prtc.getId() == id).findFirst().orElse(null);
	}

	public void save(Participant pc) {
		Participant pctu = null;

		if (pc.getId() != null) {
			pctu = findOne(pc.getId());
			int participantIndex = participants.indexOf(pctu);
			pctu.setName(pc.getName());
			pctu.setEmail(pc.getEmail());
			pctu.setLevel(pc.getLevel());
			pctu.setPrimarySkill(pc.getPrimarySkill());
			participants.set(participantIndex, pctu);
		} else {
			pc.setId(participants.size()+1);
			participants.add(pc);
		}
	}

	public void delete(int id) {
		Iterator<Participant> iter = participants.iterator();
		while (iter.hasNext()) {
			if (iter.next().getId() == id) {
				iter.remove();
			}
		}
	}

}