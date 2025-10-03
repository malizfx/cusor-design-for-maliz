import { View, Text, StyleSheet, Pressable } from 'react-native';
import { colors } from '../theme/colors';

type ExerciseCardProps = {
  title: string;
  subtitle?: string;
  onPress?: () => void;
};

export function ExerciseCard({ title, subtitle, onPress }: ExerciseCardProps) {
  return (
    <Pressable onPress={onPress} style={styles.card}>
      <View style={styles.content}>
        <Text style={styles.title}>{title}</Text>
        {!!subtitle && <Text style={styles.subtitle}>{subtitle}</Text>}
      </View>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  card: { backgroundColor: colors.surface, borderColor: colors.surfaceBorder, borderWidth: 1, borderRadius: 12, padding: 14, marginBottom: 10 },
  content: { },
  title: { color: colors.text, fontSize: 16, fontWeight: '700' },
  subtitle: { color: colors.textMuted, marginTop: 4 },
});

