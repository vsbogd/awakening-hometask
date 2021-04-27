import rospy
import std_msgs

text = [
    "How have you been doing lately?",
    "Actually, I haven't been sleeping well. I am kind of out of it.",
    "Is there some reason why you can't get enough sleep?",
    "I go to bed, but I just can't get comfortable enough to stay asleep.",
    "When do you turn in for the night ?",
    "I usually try to go to bed around 11",
    "Do you have a lot on your mind when you try to go to sleep?",
    "My mother is ill with cancer, and I think about her a lot.",
    "Do you ever meditate or read before bedtime?",
    "I usually watch a lot of television before I go to bed. Maybe I should try something else to help me quiet down.",

    "Good morning, how are you doing today?",
    "I have been feeling pretty good, Dr. Smith.",
    "So, I can see by your chart that you are here for your annual physical.",
    "Yes, I am playing on the tennis team this year, and they are requiring me to get a physical exam.",
    "We are basically going to check your heart, lungs, blood sugar levels, and eyes, ears, and nose .",
    "I've being kind of been having problems being out of breath. Can you look at that?",
    "Yes, I will check you for asthma, and maybe we can check you for allergies later.",
    "Thank you. What will the blood test tell you?",
    "We will be checking for blood sugar, cholesterol, and white blood cell count.",
    "I have been working hard to stay healthy. I hope the tests turn out well.",

    "Hi, Mr. Smith. I'm Dr. Hawkins. Why are you here today?",
    "I thought it would be a good idea to get a check-up.",
    "Yes, well you haven't had one for ... five years. You should have one every year.",
    "I know. I figure as long as there's nothing wrong, why go see the doctor?",
    "Well, the best way to avoid serious illnesses is to find out about them early. So, try to come at least once a year for your own good.",
    "O.K.",
    "Let me see here. Your eyes and ears look fine. Take a deep breath, please. Do you smoke, Mr. Smith?",
    "Yes.",
    "Smoking is the leading cause of lung cancer and heart disease, you know. You really should quit.",
    "I've tried a hundred times, but I just can't seem to kick the habit.",
    "Well, we have classes and some medications that might help. I'll give you more information before you leave.",
    "O.K., thanks, doctor."
]

if __name__ == '__main__':
    publisher = rospy.Publisher('utterance', std_msgs.msg.String,
                                queue_size=100)
    rospy.init_node('test_server', anonymous=True)

    i = 0
    while not rospy.is_shutdown():
        publisher.publish(text[i])
        i += 1
        if i >= len(text):
            i = 0
        rospy.sleep(0.1)
